import 'package:flutter/material.dart';

import '../../../app/routes.dart';
import '../../../core/constants/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      _MenuItem('Absensi', Icons.fingerprint_rounded, null),
      _MenuItem('Aktivitas', Icons.task_alt_rounded, AppRoutes.activities),
      _MenuItem('Cuti', Icons.event_available_rounded, null),
      _MenuItem('Laporan', Icons.description_rounded, null),
      _MenuItem('Notifikasi', Icons.notifications_rounded, AppRoutes.notifications),
      _MenuItem('Profil', Icons.person_rounded, AppRoutes.profile),
      _MenuItem('Booking Ruangan', Icons.meeting_room_rounded, AppRoutes.meetingRooms),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WorkWell',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.profile);
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primaryLight,
                ],
              ),
              borderRadius: BorderRadius.circular(26),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Daffa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Semoga produktif hari ini.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.15,
            children: menus.map((menu) {
              return _MenuCard(
                title: menu.title,
                icon: menu.icon,
                onTap: () {
                  if (menu.route != null) {
                    Navigator.pushNamed(context, menu.route!);
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final String? route;

  _MenuItem(this.title, this.icon, this.route);
}

class _MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primary, size: 36),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
