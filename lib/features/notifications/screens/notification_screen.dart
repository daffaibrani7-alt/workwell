import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      'Aktivitas baru berhasil ditambahkan.',
      'Dokumentasi perlu diperbarui.',
      'Rapat monitoring dijadwalkan hari ini.',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: notifications.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            leading: const Icon(Icons.notifications_rounded),
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}
