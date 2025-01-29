enum SocketMessageType {
  handshake('0'),
  subscribe('40'),
  data('42');

  final String value;
  const SocketMessageType(this.value);
}
