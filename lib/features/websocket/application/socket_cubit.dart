import 'dart:convert';

import 'package:asset_tracker/features/websocket/application/socket_message_type.dart';
import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/features/websocket/domain/meta.dart';
import 'package:asset_tracker/features/websocket/domain/price_changed_data_model.dart';
import 'package:asset_tracker/features/websocket/infrastructure/socket_repository.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  static const _retryDelaySeconds = 5;
  static const _maxRetryAttempts = 3;

  int _retryCount = 0;
  Timer? _reconnectTimer;
  final SocketRepository socketRepository;
  PriceChangedDataModel currentData =
      PriceChangedDataModel(data: {}, meta: Meta(time: 0));

  SocketCubit({required this.socketRepository}) : super(SocketInitial()) {
    _connect();
  }

  @override
  Future<void> close() {
    _reconnectTimer?.cancel();
    socketRepository.disconnect();
    return super.close();
  }

  void _connect() {
    emit(SocketLoading());
    try {
      socketRepository.connect();
      _retryCount = 0;
      emit(SocketConnected());
      _listenToSocket();
    } catch (e) {
      if (_retryCount < _maxRetryAttempts) {
        emit(SocketError(
          t.core.errors.socketConnection(
            error: e.toString(),
            current: (_retryCount + 1).toString(),
            max: _maxRetryAttempts.toString(),
          ),
        ));
        _retryConnection();
      } else {
        emit(SocketError(t.core.errors.maxRetryReached));
      }
    }
  }

  void _listenToSocket() {
    socketRepository.channel.stream.listen(
      (data) {
        print(t.socket.logs.receivedData(data: data.toString()));
        if (data.toString().startsWith(SocketMessageType.handshake.value)) {
          print(t.socket.logs.handshakeReceived);
          sendMessage(SocketMessageType.subscribe.value);
          emit(SocketLoading());
        } else if (data.toString().startsWith(SocketMessageType.data.value)) {
          _handleDataMessage(data.toString());
        }
      },
      onError: (error) {
        print(t.socket.logs.connectionLost);
        emit(SocketError(
          t.socket.status.error(
            message: error.toString(),
          ),
        ));
        _retryConnection();
      },
      onDone: () {
        print(t.socket.logs.connectionClosed);
        _reconnectAndResubscribe();
      },
    );
  }

  void _handleDataMessage(String rawMessage) {
    String rawData = rawMessage;
    int jsonStart = rawData.indexOf('{');
    int jsonEnd = rawData.lastIndexOf('}');

    if (jsonStart != -1 && jsonEnd != -1) {
      String jsonData = rawData.substring(jsonStart, jsonEnd + 1);
      if (currentData.data.isEmpty) {
        print(t.socket.logs.initialDataReceived);
        PriceChangedDataModel firstData = parseReceivedData(jsonData);
        currentData = firstData;
      } else {
        print(t.socket.logs.dataUpdated);
        updatedData(parseReceivedData(jsonData));
      }
      emit(SocketDataReceived(currentData));
    }
  }

  void _reconnectAndResubscribe() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 1), () {
      if (!socketRepository.isConnected()) {
        print(t.socket.logs.connectionLost);
        _connect();
      } else {
        print(t.socket.logs.tryingResubscribe);
        sendMessage(SocketMessageType.subscribe.value);
      }
    });
  }

  Future<void> sendMessage(String message) async {
    try {
      if (socketRepository.isConnected()) {
        socketRepository.channel.sink.add(message);
      } else {
        print(t.socket.logs.cannotSendMessage);
        _reconnectAndResubscribe();
      }
    } catch (e) {
      emit(SocketError(
        t.socket.status.error(
          message: e.toString(),
        ),
      ));
      _reconnectAndResubscribe();
    }
  }

  Future<void> disconnect() async {
    await socketRepository.channel.sink.close();
    emit(SocketDisconnected(currentData));
  }

  void _retryConnection() {
    _retryCount++;
    if (_retryCount <= _maxRetryAttempts) {
      Future.delayed(const Duration(seconds: _retryDelaySeconds), () {
        _connect();
      });
    }
  }

  PriceChangedDataModel parseReceivedData(String data) {
    try {
      dynamic jsonList = jsonDecode(data);
      final response = PriceChangedDataModel.fromJson(jsonList);

      return PriceChangedDataModel(
        data: response.data,
        meta: response.meta,
      );
    } catch (e) {
      print(t.socket.logs.jsonParseError(error: e.toString()));
      return currentData;
    }
  }

  // Mevcut verilerle yeni gelen veriyi karşılaştırarak sadece değişen verileri alır
  void updatedData(PriceChangedDataModel newData) {
    Map<String, Currency> changedData = {};

    newData.data.forEach((key, newCurrency) {
      if (!currentData.data.containsKey(key) ||
          _isCurrencyChanged(currentData.data[key]!, newCurrency)) {
        changedData[key] = newCurrency;
      }
    });

    if (changedData.isNotEmpty) {
      currentData =
          currentData.updateData(changedData).copyWith(meta: newData.meta);
    }
  }

  // Currency objesinin değişip değişmediğini kontrol eder
  bool _isCurrencyChanged(Currency oldCurrency, Currency newCurrency) {
    print(t.socket.logs.oldCurrencyLog(currency: oldCurrency.toString()));

    return oldCurrency.alis != newCurrency.alis ||
        oldCurrency.satis != newCurrency.satis ||
        oldCurrency.dusuk != newCurrency.dusuk ||
        oldCurrency.yuksek != newCurrency.yuksek ||
        oldCurrency.kapanis != newCurrency.kapanis;
  }
}
