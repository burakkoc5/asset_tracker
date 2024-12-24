import 'package:web_socket_channel/web_socket_channel.dart';

abstract class SocketRepository<T> {
  late WebSocketChannel channel;

  WebSocketChannel connect();
  Future<void> disconnect();
  void sendMessage(WebSocketChannel channel, String message);
}
