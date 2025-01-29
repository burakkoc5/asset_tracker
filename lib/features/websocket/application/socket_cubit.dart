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
  String _searchQuery = '';

  SocketCubit({required this.socketRepository}) : super(SocketInitial()) {
    _searchQuery = '';
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
        if (data.toString().startsWith(SocketMessageType.handshake.value)) {
          sendMessage(SocketMessageType.subscribe.value);
          emit(SocketLoading());
        } else if (data.toString().startsWith(SocketMessageType.data.value)) {
          _handleDataMessage(data.toString());
        }
      },
      onError: (error) {
        emit(SocketError(
          t.socket.status.error(
            message: error.toString(),
          ),
        ));
        _retryConnection();
      },
      onDone: () {
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
        PriceChangedDataModel firstData = parseReceivedData(jsonData);
        currentData = firstData;
      } else {
        updatedData(parseReceivedData(jsonData));
      }
      _emitFilteredData();
    }
  }

  void _reconnectAndResubscribe() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 1), () {
      if (!socketRepository.isConnected()) {
        _connect();
      } else {
        sendMessage(SocketMessageType.subscribe.value);
      }
    });
  }

  Future<void> sendMessage(String message) async {
    try {
      if (socketRepository.isConnected()) {
        socketRepository.channel.sink.add(message);
      } else {
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
    return oldCurrency.alis != newCurrency.alis ||
        oldCurrency.satis != newCurrency.satis ||
        oldCurrency.dusuk != newCurrency.dusuk ||
        oldCurrency.yuksek != newCurrency.yuksek ||
        oldCurrency.kapanis != newCurrency.kapanis;
  }

  void filterData(String query) {
    _searchQuery = query.toLowerCase().trim();
    _emitFilteredData();
  }

  void resetSearch() {
    _searchQuery = '';
    _emitFilteredData();
  }

  void _emitFilteredData() {
    if (_searchQuery.isEmpty) {
      emit(SocketDataReceived(currentData));
    } else {
      final filteredData = Map<String, Currency>.from(currentData.data)
        ..removeWhere((key, value) {
          final name = Currency.currencyNames[key]?.toLowerCase() ?? '';
          return !key.toLowerCase().contains(_searchQuery) &&
              !name.contains(_searchQuery);
        });

      emit(SocketDataReceived(PriceChangedDataModel(
        data: filteredData,
        meta: currentData.meta,
      )));
    }
  }
}
