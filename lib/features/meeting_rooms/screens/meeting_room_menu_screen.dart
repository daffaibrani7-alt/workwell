import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'meeting_room_booking_screen.dart';
import '../models/meeting_room_model.dart';

class MeetingRoomMenuScreen extends StatefulWidget {
  const MeetingRoomMenuScreen({super.key});

  @override
  State<MeetingRoomMenuScreen> createState() => _MeetingRoomMenuScreenState();
}

class _MeetingRoomMenuScreenState extends State<MeetingRoomMenuScreen> {
  int selectedTab = 0;

  final tabs = const [
    'Room',
    'Riwayat',
    'Ketersediaan',
  ];

  final rooms = const [
    MeetingRoom(
      name: 'Aula Mudjono',
      location: 'Gd. Annex Lt. 4',
      capacity: 30,
      isAvailable: true,
      description: 'Tersedia sekarang • Hybrid • Proyektor • WiFi',
    ),
    MeetingRoom(
      name: 'Ruang Simorangkir',
      location: 'Gd. Induk Lt. 4',
      capacity: 16,
      isAvailable: false,
      description: 'Dipakai sampai 13.00 • Offline • TV Conference',
    ),
    MeetingRoom(
      name: 'Ruang Kolaborasi',
      location: 'Gd. Induk Lt. 3',
      capacity: 20,
      isAvailable: true,
      description: 'Tersedia sekarang • Hybrid • Whiteboard • WiFi',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: selectedTab == 0
          ? FloatingActionButton(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MeetingRoomBookingScreen(room: rooms.first),
                  ),
                );
              },
              child: const Icon(Icons.add_rounded),
            )
          : null,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Ruangan Rapat',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          const _TopHeader(),
          const SizedBox(height: 18),
          _PillTabs(
            tabs: tabs,
            selectedIndex: selectedTab,
            onChanged: (index) {
              setState(() {
                selectedTab = index;
              });
            },
          ),
          const SizedBox(height: 22),
          if (selectedTab == 0) _RoomTab(rooms: rooms),
          if (selectedTab == 1) const _HistoryTab(),
          if (selectedTab == 2) const _AvailabilityTab(),
        ],
      ),
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, Daffa',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Mau booking ruangan apa hari ini?',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 25,
                  height: 1.15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.4,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Center(
            child: Text(
              'DI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PillTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _PillTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE8ECF3)),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final selected = selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? Colors.white : AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _RoomTab extends StatelessWidget {
  final List<MeetingRoom> rooms;

  const _RoomTab({required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TimelineCard(),
        const SizedBox(height: 18),
        ...rooms.map((room) => _RoomCard(room: room)),
      ],
    );
  }
}

class _TimelineCard extends StatelessWidget {
  const _TimelineCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE8ECF3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Timeline Hari Ini',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                ),
              ),
              Spacer(),
              Text(
                '3 tersedia',
                style: TextStyle(
                  color: AppColors.success,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(16, (index) {
              final busy = index == 2 || index == 3 || index == 9 || index == 10;
              return Expanded(
                child: Container(
                  height: index == 9 ? 50 : 38,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: busy
                        ? const Color(0xFFD1D5DB)
                        : AppColors.success.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              _LegendDot(color: AppColors.success, label: 'Available'),
              SizedBox(width: 14),
              _LegendDot(color: Color(0xFFD1D5DB), label: 'Busy'),
              Spacer(),
              Icon(Icons.verified_user_outlined, size: 16, color: AppColors.warning),
              SizedBox(width: 4),
              Text(
                'Butuh approval',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 9, height: 9, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _RoomCard extends StatelessWidget {
  final MeetingRoom room;

  const _RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE8ECF3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: () {
            if (room.isAvailable) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MeetingRoomBookingScreen(room: room),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: room.isAvailable
                          ? [
                              AppColors.primary.withValues(alpha: 0.95),
                              AppColors.primaryLight.withValues(alpha: 0.72),
                            ]
                          : [
                              const Color(0xFF6B7280),
                              const Color(0xFF9CA3AF),
                            ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20,
                        bottom: -24,
                        child: Icon(
                          Icons.meeting_room_rounded,
                          color: Colors.white.withValues(alpha: 0.16),
                          size: 132,
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 16,
                        child: _AvailabilityBadge(available: room.isAvailable),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  room.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${room.capacity} orang • ${room.location}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  room.description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const _FacilityIcon(icon: Icons.desktop_windows_rounded),
                    const SizedBox(width: 8),
                    const _FacilityIcon(icon: Icons.wifi_rounded),
                    const SizedBox(width: 8),
                    const _FacilityIcon(icon: Icons.mic_rounded),
                    const Spacer(),
                    Text(
                      room.isAvailable ? 'Booking' : 'Lihat Jadwal',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.primary,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  final bool available;

  const _AvailabilityBadge({required this.available});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: available ? AppColors.success : AppColors.danger,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
          Text(
            available ? 'Available now' : 'Busy',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _FacilityIcon extends StatelessWidget {
  final IconData icon;

  const _FacilityIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 19, color: AppColors.textSecondary);
  }
}

class _HistoryTab extends StatelessWidget {
  const _HistoryTab();

  @override
  Widget build(BuildContext context) {
    final histories = [
      ['Rapat Monitoring WorkWell', 'Aula Mudjono', 'Disetujui'],
      ['Koordinasi ILDIS', 'Ruang Simorangkir', 'Selesai'],
      ['Pembahasan Data JDIHN', 'Ruang Kolaborasi', 'Menunggu'],
    ];

    return Column(
      children: histories.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE8ECF3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.history_rounded, color: AppColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item[0], style: const TextStyle(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Text(item[1], style: const TextStyle(color: AppColors.textSecondary)),
                  ],
                ),
              ),
              Text(
                item[2],
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _AvailabilityTab extends StatelessWidget {
  const _AvailabilityTab();

  @override
  Widget build(BuildContext context) {
    final entries = [
      _AvailabilityEntry(
        startTime: '08:00',
        endTime: '12:00',
        roomName: 'Aula Mudjono',
        reservationCount: '1 reservasi',
        roomLocationShort: 'Gd. Annex Lt. 4',
        title: 'Sesi Kupas Data dan Fakta Hukum (SEKATA#21)',
        type: 'Hybrid',
        dateLabel: 'Kamis, 11 Jun 2026',
        timeLabel: '08.00 - 12.00',
        organizer: 'Maya Safira, S.Kom.',
        roomLocationFull: 'Aula Mudjono · Gd. Annex Lt. 4',
        unit: 'Pusat Pembudayaan dan Bantuan Hukum',
      ),
      _AvailabilityEntry(
        startTime: '13:00',
        endTime: '15:00',
        roomName: 'Ruang Simorangkir',
        reservationCount: '1 reservasi',
        roomLocationShort: 'Gd. Induk Lt. 4',
        title: 'Rapat Lanjutan Pembahasan BAST AIPJ3',
        type: 'Offline',
        dateLabel: 'Kamis, 11 Jun 2026',
        timeLabel: '13.00 - 15.00',
        organizer: 'Daffa Ibrani, S.Kom.',
        roomLocationFull: 'Ruang Simorangkir · Gd. Induk Lt. 4',
        unit: 'Pusat Data dan Informasi Hukum',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _AvailabilityDateHeader(),
        const SizedBox(height: 18),
        ...entries.map((entry) => _AvailabilityTimelineItem(entry: entry)),
      ],
    );
  }
}

class _AvailabilityEntry {
  final String startTime;
  final String endTime;
  final String roomName;
  final String reservationCount;
  final String roomLocationShort;
  final String title;
  final String type;
  final String dateLabel;
  final String timeLabel;
  final String organizer;
  final String roomLocationFull;
  final String unit;

  const _AvailabilityEntry({
    required this.startTime,
    required this.endTime,
    required this.roomName,
    required this.reservationCount,
    required this.roomLocationShort,
    required this.title,
    required this.type,
    required this.dateLabel,
    required this.timeLabel,
    required this.organizer,
    required this.roomLocationFull,
    required this.unit,
  });
}

class _AvailabilityDateHeader extends StatelessWidget {
  const _AvailabilityDateHeader();

  @override
  Widget build(BuildContext context) {
    final days = [
      ('S', '8'),
      ('M', '9'),
      ('T', '10'),
      ('W', '11'),
      ('T', '12'),
      ('F', '13'),
      ('S', '14'),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 26, 24, 26),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: const Color(0xFFE8ECF3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.045),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '11',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                  height: 0.95,
                  letterSpacing: -2.5,
                ),
              ),
              const SizedBox(width: 14),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thu',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFB7BECC),
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Jun 2026',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFB7BECC),
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Today',
                  style: TextStyle(
                    color: AppColors.success,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFBFCFE),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: List.generate(days.length, (index) {
                final item = days[index];
                final selected = index == 3;

                return Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.24),
                                blurRadius: 14,
                                offset: const Offset(0, 8),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      children: [
                        Text(
                          item.$1,
                          style: TextStyle(
                            color: selected
                                ? Colors.white.withValues(alpha: 0.86)
                                : const Color(0xFFB7BECC),
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.$2,
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : AppColors.textPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailabilityTimelineItem extends StatelessWidget {
  final _AvailabilityEntry entry;

  const _AvailabilityTimelineItem({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 58,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.startTime,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  entry.endTime,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFB4BCC8),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF07090D),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: const Color(0xFF171A20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(child: _RoomNameDarkBadge(name: entry.roomName)),
                      const SizedBox(width: 10),
                      Text(
                        entry.reservationCount,
                        style: const TextStyle(
                          color: Color(0xFF9AA3AF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    entry.roomLocationShort,
                    style: const TextStyle(
                      color: Color(0xFFAEB4BE),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF14171D),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF232730)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _DarkTypeBadge(label: entry.type),
                        const SizedBox(height: 16),
                        _DarkInfoRow(
                          icon: Icons.access_time_rounded,
                          title: entry.dateLabel,
                          subtitle: entry.timeLabel,
                        ),
                        const SizedBox(height: 14),
                        _DarkInfoRow(
                          icon: Icons.person_outline_rounded,
                          title: entry.organizer,
                        ),
                        const SizedBox(height: 14),
                        _DarkInfoRow(
                          icon: Icons.location_on_outlined,
                          title: entry.roomLocationFull,
                        ),
                        const SizedBox(height: 14),
                        _DarkInfoRow(
                          icon: Icons.apartment_outlined,
                          title: entry.unit,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoomNameDarkBadge extends StatelessWidget {
  final String name;

  const _RoomNameDarkBadge({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color(0xFF4B7BFF),
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _DarkTypeBadge extends StatelessWidget {
  final String label;

  const _DarkTypeBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final isHybrid = label.toLowerCase() == 'hybrid';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: isHybrid
            ? AppColors.primary.withValues(alpha: 0.14)
            : AppColors.success.withValues(alpha: 0.14),
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
            color: isHybrid ? const Color(0xFF6EA0FF) : AppColors.success,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isHybrid ? const Color(0xFF6EA0FF) : AppColors.success,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _DarkInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const _DarkInfoRow({
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: subtitle == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: const Color(0xFF8B9099)),
        const SizedBox(width: 12),
        Expanded(
          child: subtitle == null
              ? Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        color: Color(0xFFA6ACB5),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
