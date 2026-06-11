import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class MeetingRoomHistoryScreen extends StatelessWidget {
  const MeetingRoomHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final histories = [
      ['Rapat Monitoring WorkWell', 'Ruang Rapat Utama', 'Selesai'],
      ['Koordinasi ILDIS', 'Ruang Rapat Harmoni', 'Selesai'],
      ['Pembahasan JDIHN', 'Ruang Rapat Kolaborasi', 'Dibatalkan'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Reservasi')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: histories.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = histories[index];
          final isCanceled = item[2] == 'Dibatalkan';

          return ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            leading: Icon(
              isCanceled ? Icons.cancel_rounded : Icons.check_circle_rounded,
              color: isCanceled ? AppColors.danger : AppColors.success,
            ),
            title: Text(
              item[0],
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            subtitle: Text(item[1]),
            trailing: Text(
              item[2],
              style: TextStyle(
                color: isCanceled ? AppColors.danger : AppColors.success,
                fontWeight: FontWeight.w800,
              ),
            ),
          );
        },
      ),
    );
  }
}
