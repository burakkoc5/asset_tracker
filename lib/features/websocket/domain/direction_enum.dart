enum Direction {
  UP,
  DOWN,
}

extension DirectionExtension on Direction {
  String toJson() {
    switch (this) {
      case Direction.UP:
        return 'up';
      case Direction.DOWN:
        return 'down';
    }
  }

  static Direction fromJson(String json) {
    switch (json) {
      case 'up':
        return Direction.UP;
      case 'down':
        return Direction.DOWN;
      default:
        throw Exception('Unknown direction');
    }
  }
}
