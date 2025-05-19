import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/game.dart';

class CsvService {
  static Future<List<Game>> loadGames() async {
    final raw = await rootBundle.loadString('assets/games.csv');
    final lines = const LineSplitter().convert(raw);

    return lines
        .skip(1)
        .map((line) => Game.fromCsv(line.split(',')))
        .toList();
  }
}
