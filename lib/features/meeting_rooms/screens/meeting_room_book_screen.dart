import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class MeetingRoomBookScreen extends StatelessWidget {
  const MeetingRoomBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final schedules = [
      _ScheduleItem(
        title: 'Rapat Monitoring Progres WorkWell',
        room: 'Ruang Rapat Utama',
        time: 'Hari ini • 09:00 - 10:30',
        status: 'Mendatang',
        type: 'Hybrid',
        owner: 'Saya',
      ),
      _ScheduleItem(
        title: 'Koordinasi Dokumentasi ILDIS',
        room: 'Ruang Rapat Harmoni',
        time: 'Besok • 13:00 - 14:30',
        status: 'Disetujui',
        type: 'Offline',
        owner: 'Unit TI',
      ),
      _ScheduleItem(
        title: 'Pembahasan Data JDIHN',
        room: 'Ruang Rapat Kolaborasi',
        time: 'Jumat • 10:00 - 11:30',
        status: 'Menunggu',
        type: 'Hybrid',
        owner: 'BPHN',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Buku Reservasi')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Kegiatan Mendatang',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Saring menurut waktu, status, kepemilikan, atau hybrid.',
            style: TextStyle(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _FilterChip(label: 'Semua Waktu'),
              _FilterChip(label: 'Mendatang'),
              _FilterChip(label: 'Status'),
              _FilterChip(label: 'Milik Saya'),
              _FilterChip(label: 'Hybrid'),
            ],
          ),
          const SizedBox(height: 18),
          ...schedules.map((schedule) => _ScheduleCard(item: schedule)),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _ScheduleItem {
  final String title;
  final String room;
  final String time;
  final String status;
  final String type;
  final String owner;

  _ScheduleItem({
    required this.title,
    required this.room,
    required this.time,
    required this.status,
    required this.type,
    required this.owner,
  });
}

class _ScheduleCard extends StatelessWidget {
  final _ScheduleItem item;

  const _ScheduleCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.room,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            item.time,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            children: [
              _Badge(label: item.status),
              _Badge(label: item.type),
              _Badge(label: item.owner),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;

  const _Badge({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: AppColors.primary.withValues(alpha: 0.10),
      labelStyle: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}
