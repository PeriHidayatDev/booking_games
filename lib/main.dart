import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/game_provider.dart';
import 'screens/game_list_screen.dart';

void main() {
  runApp(const GameApp());
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: MaterialApp(
        title: 'Game Booking',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const GameListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
