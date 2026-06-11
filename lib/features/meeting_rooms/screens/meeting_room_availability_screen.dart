import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class MeetingRoomAvailabilityScreen extends StatelessWidget {
  const MeetingRoomAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roomSchedules = [
      _RoomSchedule(
        roomName: 'Aula Mudjono',
        location: 'Gd. Annex Lt. 4',
        reservations: [
          _ReservationItem(
            title: 'Sesi Kupas Data dan Fakta Hukum (SEKATA#21)',
            date: 'Kamis, 11 Jun 2026',
            time: '08.00 - 12.00',
            organizer: 'Maya Safira, S.Kom.',
            room: 'Aula Mudjono',
            roomLocation: 'Gd. Annex Lt. 4',
            unit: 'Pusat Pembudayaan dan Bantuan Hukum',
            type: 'Hybrid',
          ),
        ],
      ),
      _RoomSchedule(
        roomName: 'Ruang Simorangkir',
        location: 'Gd. Induk Lt. 4',
        reservations: [
          _ReservationItem(
            title: 'Rapat Lanjutan Pembahasan BAST AIPJ3',
            date: 'Kamis, 11 Jun 2026',
            time: '10.00 - 13.00',
            organizer: 'Daffa Ibrani, S.Kom.',
            room: 'Ruang Simorangkir',
            roomLocation: 'Gd. Induk Lt. 4',
            unit: 'Pusat Data dan Informasi Hukum',
            type: 'Offline',
          ),
        ],
      ),
      _RoomSchedule(
        roomName: 'Ruang Rapat Soepomo',
        location: 'Gd. Induk Lt. 3',
        reservations: [
          _ReservationItem(
            title: 'Koordinasi Pengembangan Aplikasi WorkWell',
            date: 'Kamis, 11 Jun 2026',
            time: '14.00 - 15.30',
            organizer: 'Tim Pengembang',
            room: 'Ruang Rapat Soepomo',
            roomLocation: 'Gd. Induk Lt. 3',
            unit: 'Sekretariat Badan',
            type: 'Hybrid',
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Cek Ketersediaan')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Cek ketersediaan',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Pilih tanggal dan tampilan daftar atau kalender untuk melihat jadwal ruangan.',
            style: TextStyle(color: AppColors.textSecondary, height: 1.4),
          ),
          const SizedBox(height: 22),
          const _FilterSection(),
          const SizedBox(height: 18),
          ...roomSchedules.map(
            (schedule) => _RoomScheduleCard(schedule: schedule),
          ),
        ],
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  const _FilterSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _FilterBox(
                icon: Icons.meeting_room_outlined,
                label: 'Semua Ruangan',
                trailing: Icons.keyboard_arrow_down_rounded,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _FilterBox(
                icon: Icons.calendar_today_rounded,
                label: '11 Jun 2026',
                trailing: Icons.calendar_month_rounded,
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  _ViewToggleButton(
                    label: 'Daftar',
                    icon: Icons.view_list_rounded,
                    selected: true,
                    onTap: () {},
                  ),
                  _ViewToggleButton(
                    label: 'Kalender',
                    icon: Icons.calendar_month_rounded,
                    selected: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FilterBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final IconData trailing;
  final VoidCallback onTap;

  const _FilterBox({
    required this.icon,
    required this.label,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Icon(icon, size: 18, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Icon(trailing, size: 18, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewToggleButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ViewToggleButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          child: Row(
            children: [
              Icon(
                icon,
                size: 17,
                color: selected ? Colors.white : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : AppColors.textSecondary,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoomSchedule {
  final String roomName;
  final String location;
  final List<_ReservationItem> reservations;

  const _RoomSchedule({
    required this.roomName,
    required this.location,
    required this.reservations,
  });
}

class _ReservationItem {
  final String title;
  final String date;
  final String time;
  final String organizer;
  final String room;
  final String roomLocation;
  final String unit;
  final String type;

  const _ReservationItem({
    required this.title,
    required this.date,
    required this.time,
    required this.organizer,
    required this.room,
    required this.roomLocation,
    required this.unit,
    required this.type,
  });
}

class _RoomScheduleCard extends StatelessWidget {
  final _RoomSchedule schedule;

  const _RoomScheduleCard({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _RoomNameBadge(name: schedule.roomName),
              const SizedBox(width: 10),
              Text(
                '${schedule.reservations.length} reservasi',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            schedule.location,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          ...schedule.reservations.map(
            (reservation) => _ReservationCard(item: reservation),
          ),
        ],
      ),
    );
  }
}

class _RoomNameBadge extends StatelessWidget {
  final String name;

  const _RoomNameBadge({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 180),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.info_outline_rounded,
            size: 16,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _ReservationCard extends StatelessWidget {
  final _ReservationItem item;

  const _ReservationCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          _TypeBadge(label: item.type),
          const SizedBox(height: 16),
          _InfoRow(
            icon: Icons.access_time_rounded,
            title: item.date,
            subtitle: item.time,
          ),
          const SizedBox(height: 12),
          _InfoRow(icon: Icons.person_outline_rounded, title: item.organizer),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.location_on_outlined,
            title: '${item.room} • ${item.roomLocation}',
          ),
          const SizedBox(height: 12),
          _InfoRow(icon: Icons.apartment_rounded, title: item.unit),
        ],
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String label;

  const _TypeBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final isHybrid = label.toLowerCase() == 'hybrid';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isHybrid
            ? AppColors.primary.withValues(alpha: 0.10)
            : AppColors.success.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: isHybrid
              ? AppColors.primary.withValues(alpha: 0.30)
              : AppColors.success.withValues(alpha: 0.30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isHybrid ? Icons.language_rounded : Icons.groups_rounded,
            size: 14,
            color: isHybrid ? AppColors.primary : AppColors.success,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: isHybrid ? AppColors.primary : AppColors.success,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const _InfoRow({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: subtitle == null
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 19, color: AppColors.textSecondary),
        const SizedBox(width: 10),
        Expanded(
          child: subtitle == null
              ? Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle!,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
