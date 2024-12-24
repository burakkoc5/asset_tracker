import 'dart:convert';

import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/features/websocket/domain/meta.dart';
import 'package:asset_tracker/features/websocket/domain/price_changed_data_model.dart';
import 'package:asset_tracker/features/websocket/infrastructure/socket_repository.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  final SocketRepository socketRepository;
  PriceChangedDataModel currentData =
      PriceChangedDataModel(data: {}, meta: Meta(time: 0));

  SocketCubit({required this.socketRepository}) : super(SocketInitial()) {
    _connect();
  }

  void _connect() {
    emit(SocketLoading());
    try {
      socketRepository.connect();
      emit(SocketConnected());
      _listenToSocket();
    } catch (e) {
      emit(SocketError(e.toString()));
      _retryConnection();
    }
  }

  void _listenToSocket() {
    socketRepository.channel.stream.listen(
      (data) {
        if (data.toString().startsWith('0')) {
          print('Data 0 ile aslıyor 40 gönnder');
          sendMessage('40');
          emit(SocketLoading());
        } else if (data.toString().startsWith('42')) {
          if (currentData.data.isEmpty) {
            print('Data set for the first time');
            PriceChangedDataModel firstData = parseReceivedData(
                data.toString().substring(19, data.toString().length - 1));

            currentData = firstData;
            emit(SocketDataReceived(currentData));
          } else {
            print('Data updated');
            updatedData(parseReceivedData(
                data.toString().substring(19, data.toString().length - 1)));
            print(currentData.data);
            emit(SocketDataReceived(currentData));
          }
        }
      },
      onError: (error) {
        emit(SocketError(error.toString()));
        _retryConnection();
      },
      onDone: () {
        emit(SocketDisconnected(currentData));
        _retryConnection();
      },
    );
  }

  Future<void> sendMessage(String message) async {
    try {
      socketRepository.channel.sink.add(message);
    } catch (e) {
      emit(SocketError(e.toString()));
    }
  }

  Future<void> disconnect() async {
    await socketRepository.channel.sink.close();
    emit(SocketDisconnected(currentData));
  }

  void _retryConnection() {
    Future.delayed(const Duration(seconds: 5), () {
      _connect();
    });
  }

  PriceChangedDataModel parseReceivedData(String data) {
    dynamic jsonList = jsonDecode(data); // Decoding the list

    final response = PriceChangedDataModel.fromJson(jsonList);

    return PriceChangedDataModel(
      data: response.data,
      meta: response.meta, // Meta bilgileri olduğu gibi gönder
    );
  }

  // Mevcut verilerle yeni gelen veriyi karşılaştırarak sadece değişen verileri alır
  void updatedData(PriceChangedDataModel newData) {
    Map<String, Currency> updatedData = {};

    newData.data.forEach((key, value) {
      // Eğer eski veride değişiklik varsa, o veriyi güncelle
      if (currentData.data.containsKey(key)) {
        if (_isCurrencyChanged(currentData.data[key]!, value)) {
          currentData.data[key] = value; // Currency değişti, güncelle
        }
      } else {
        // Yeni gelen currency, mevcut veride yoksa, yeni ekleyelim
        updatedData[key] = value;
      }
    });

    // Güncellenmiş currency verisini döndür
    currentData.meta.time = newData.meta.time;
    currentData.data.addAll(updatedData);
  }

  // Currency objesinin değişip değişmediğini kontrol eder
  bool _isCurrencyChanged(Currency oldCurrency, Currency newCurrency) {
    print('Old Currency: $oldCurrency');

    return oldCurrency.alis != newCurrency.alis ||
        oldCurrency.satis != newCurrency.satis ||
        oldCurrency.dusuk != newCurrency.dusuk ||
        oldCurrency.yuksek != newCurrency.yuksek ||
        oldCurrency.kapanis != newCurrency.kapanis;
  }
}
