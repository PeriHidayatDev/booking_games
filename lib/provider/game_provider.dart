import 'package:flutter/foundation.dart';
import '../data/csv_service.dart';
import '../models/game.dart';

class GameProvider extends ChangeNotifier {
  List<Game> _games = [];
  bool _isLoading = false;

  List<Game> get games => _games;
  bool get isLoading => _isLoading;

  Future<void> loadGames() async {
    _isLoading = true;
    notifyListeners();

    _games = await CsvService.loadGames();

    _isLoading = false;
    notifyListeners();
  }
}
