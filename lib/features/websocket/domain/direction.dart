class Direction {
  final String alisDir;
  final String satisDir;

  const Direction({
    required this.alisDir,
    required this.satisDir,
  });

  factory Direction.fromJson(Map<String, dynamic> json) {
    return Direction(
      alisDir: json['alis_dir'] as String? ?? '',
      satisDir: json['satis_dir'] as String? ?? '',
    );
  }

  bool get isDown => alisDir == 'down' && satisDir == 'down';
  bool get isUp => alisDir == 'up' && satisDir == 'up';
  bool get isStable => !isUp && !isDown;

  Map<String, dynamic> toJson() {
    return {
      'alis_dir': alisDir,
      'satis_dir': satisDir,
    };
  }

  @override
  String toString() {
    return 'Direction(alisDir: $alisDir, satisDir: $satisDir)';
  }
}
