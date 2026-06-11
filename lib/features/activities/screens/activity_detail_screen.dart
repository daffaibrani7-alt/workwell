import 'package:flutter/material.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Aktivitas')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Detail aktivitas kerja akan ditampilkan di halaman ini.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
