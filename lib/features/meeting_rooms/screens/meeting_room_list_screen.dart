import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../models/meeting_room_model.dart';
import 'meeting_room_booking_screen.dart';

class MeetingRoomListScreen extends StatelessWidget {
  const MeetingRoomListScreen({super.key});

  static const List<MeetingRoom> rooms = [
    MeetingRoom(
      name: 'Ruang Rapat Utama',
      location: 'Gedung BPHN Lantai 1',
      capacity: 30,
      isAvailable: true,
      description: 'Cocok untuk rapat besar, koordinasi unit, dan presentasi.',
    ),
    MeetingRoom(
      name: 'Ruang Rapat Harmoni',
      location: 'Gedung BPHN Lantai 2',
      capacity: 16,
      isAvailable: true,
      description: 'Cocok untuk diskusi tim dan rapat internal.',
    ),
    MeetingRoom(
      name: 'Ruang Rapat Integritas',
      location: 'Gedung BPHN Lantai 3',
      capacity: 12,
      isAvailable: false,
      description: 'Sedang digunakan untuk agenda rapat lain.',
    ),
    MeetingRoom(
      name: 'Ruang Rapat Kolaborasi',
      location: 'Gedung BPHN Lantai 4',
      capacity: 20,
      isAvailable: true,
      description: 'Cocok untuk workshop dan pembahasan lintas unit.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Ruangan')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.meeting_room_rounded, color: Colors.white, size: 38),
                SizedBox(height: 14),
                Text(
                  'Pilih Ruangan Rapat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Lihat ketersediaan ruangan dan ajukan jadwal booking rapat.',
                  style: TextStyle(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Daftar Ruangan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...rooms.map((room) => _RoomCard(room: room)),
        ],
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  final MeetingRoom room;

  const _RoomCard({required this.room});

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
          Row(
            children: [
              const Icon(Icons.business_rounded, color: AppColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  room.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              _StatusBadge(isAvailable: room.isAvailable),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            room.description,
            style: const TextStyle(color: AppColors.textSecondary, height: 1.4),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 18,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  room.location,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.people_outline_rounded,
                size: 18,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 6),
              Text(
                'Kapasitas ${room.capacity} orang',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              onPressed: room.isAvailable
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MeetingRoomBookingScreen(room: room),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade300,
                disabledForegroundColor: Colors.grey.shade600,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                room.isAvailable ? 'Booking Ruangan' : 'Tidak Tersedia',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isAvailable;

  const _StatusBadge({required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isAvailable
            ? AppColors.success.withValues(alpha: 0.12)
            : AppColors.danger.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        isAvailable ? 'Tersedia' : 'Dipakai',
        style: TextStyle(
          color: isAvailable ? AppColors.success : AppColors.danger,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
