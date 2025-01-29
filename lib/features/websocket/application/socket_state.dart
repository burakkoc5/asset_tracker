part of 'socket_cubit.dart';

abstract class SocketState {}

class SocketInitial extends SocketState {}

class SocketLoading extends SocketState {}

class SocketConnected extends SocketState {}

class SocketDataReceived extends SocketState {
  final PriceChangedDataModel data;
  SocketDataReceived(this.data);
}

class SocketDisconnected extends SocketState {
  final PriceChangedDataModel data;
  SocketDisconnected(this.data);
}

class SocketError extends SocketState {
  final String error;
  SocketError(this.error);
}
