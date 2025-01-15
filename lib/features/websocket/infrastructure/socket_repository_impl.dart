import 'package:asset_tracker/features/websocket/infrastructure/socket_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketRepositoryImpl<T> implements SocketRepository<T> {
  SocketRepositoryImpl({required this.socketName});

  final String socketName;

  @override
  late WebSocketChannel channel = connect();

  @override
  WebSocketChannel connect() {
    return channel = WebSocketChannel.connect(
      Uri.parse(dotenv.env[socketName]!),
    );
  }

  @override
  void sendMessage(String message) {
    channel.sink.add(message);
  }

  @override
  Future<void> disconnect() async {
    await channel.sink.close();
  }

  @override
  bool isConnected() {
    try {
      return channel.closeCode == null;
    } catch (e) {
      return false;
    }
  }
}
