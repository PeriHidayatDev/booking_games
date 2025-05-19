class Game {
  final String gameTitle;
  final String venueName;
  final DateTime dateTime;
  final double gameDuration;
  final int currentPlayers;
  final int maxPlayers;
  final int costPerPlayer;
  final String hostName;

  Game({
    required this.gameTitle,
    required this.venueName,
    required this.dateTime,
    required this.gameDuration,
    required this.currentPlayers,
    required this.maxPlayers,
    required this.costPerPlayer,
    required this.hostName,
  });

  int get remainingSlots => maxPlayers - currentPlayers;

  factory Game.fromCsv(List<String> values) {
    return Game(
      gameTitle: values[0],
      venueName: values[1],
      dateTime: DateTime.parse(values[2]),
      gameDuration: double.parse(values[3]),
      currentPlayers: int.parse(values[4]),
      maxPlayers: int.parse(values[5]),
      costPerPlayer: int.parse(values[6]),
      hostName: values[7],
    );
  }
}
