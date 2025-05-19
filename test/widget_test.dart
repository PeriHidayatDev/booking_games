import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';
import 'package:game_app/provider/game_provider.dart';

void main() {
  testWidgets('Menampilkan daftar game dari CSV', (WidgetTester tester) async {
    // Jalankan widget dengan Provider yang dibutuhkan
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GameProvider()..loadGames()),
        ],
        // child: const MyApp(),
      ),
    );

    // Tunggu frame agar data CSV bisa dimuat
    await tester.pumpAndSettle();

    // Cek apakah minimal satu judul game muncul di UI
    expect(find.byType(ListTile), findsWidgets);

    // Contoh pengecekan teks spesifik (opsional, tergantung isi CSV kamu)
    // expect(find.text('Futsal Seru Bareng'), findsOneWidget);
  });
}
