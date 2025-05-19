import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/game.dart';

class BookingScreen extends StatelessWidget {
  final Game game;

  const BookingScreen({super.key, required this.game});

  bool canWaitlist() {
    final now = DateTime.now();
    return game.dateTime.difference(now).inHours <= 6;
  }

  void _showDialog(BuildContext context, String mode) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Booking Dikonfirmasi'),
        content: Text('Kamu memilih: $mode'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Booking Game'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _infoCard(currency),
            const SizedBox(height: 16),
            _actionCard(context),
          ],
        ),
      ),
    );
  }

  Widget _typeCard(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? Colors.teal[600] : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _infoCard(NumberFormat currency) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          _infoRow("Venue", game.venueName),
          _infoRow("Tanggal",
              DateFormat('dd MMM yyyy, HH:mm').format(game.dateTime)),
          _infoRow("Durasi", "${game.gameDuration} jam"),
          _infoRow("Host", game.hostName),
          _infoRow("Harga/Pemain", currency.format(game.costPerPlayer)),
          _infoRow("Sisa Slot", "${game.remainingSlots}"),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _actionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          _bookButton(
            icon: Icons.person,
            label: "Book sebagai Solo Player",
            color: Colors.teal,
            onPressed: () => _showDialog(context, 'Solo Player'),
          ),
          const SizedBox(height: 12),
          _bookButton(
            icon: Icons.groups,
            label: "Book sebagai Tim",
            color: Colors.indigo,
            onPressed: () => _showDialog(context, '7/8 Pemain'),
          ),
          const SizedBox(height: 12),
          _bookButton(
            icon: Icons.access_time_filled,
            label: "Gabung Waitlist",
            color: Colors.orange,
            onPressed:
                canWaitlist() ? () => _showDialog(context, 'Waitlist') : null,
          ),
        ],
      ),
    );
  }

  Widget _bookButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 20),
      label: Text(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
