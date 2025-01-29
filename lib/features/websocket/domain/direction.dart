class Direction {
  final String buyDirection;
  final String sellDirection;

  const Direction({
    required this.buyDirection,
    required this.sellDirection,
  });

  factory Direction.fromJson(Map<String, dynamic> json) {
    return Direction(
      buyDirection: json['alis_dir'] as String? ?? '',
      sellDirection: json['satis_dir'] as String? ?? '',
    );
  }

  bool get isDown => buyDirection == 'down' && sellDirection == 'down';
  bool get isUp => buyDirection == 'up' && sellDirection == 'up';
  bool get isStable => !isUp && !isDown;

  Map<String, dynamic> toJson() {
    return {
      'alis_dir': buyDirection,
      'satis_dir': sellDirection,
    };
  }

  @override
  String toString() {
    return 'Direction(buyDirection: $buyDirection, sellDirection: $sellDirection)';
  }
}
