import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../models/meeting_room_model.dart';

class MeetingRoomBookingScreen extends StatefulWidget {
  final MeetingRoom room;

  const MeetingRoomBookingScreen({super.key, required this.room});

  @override
  State<MeetingRoomBookingScreen> createState() =>
      _MeetingRoomBookingScreenState();
}

class _MeetingRoomBookingScreenState extends State<MeetingRoomBookingScreen> {
  final TextEditingController agendaController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  DateTime? selectedDate;

  @override
  void dispose() {
    agendaController.dispose();
    participantController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();

    final result = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
      initialDate: selectedDate ?? now,
    );

    if (result != null) {
      setState(() {
        selectedDate = result;
      });
    }
  }

  void _submitBooking() {
    if (selectedDate == null ||
        agendaController.text.isEmpty ||
        participantController.text.isEmpty ||
        startTimeController.text.isEmpty ||
        endTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi semua data booking terlebih dahulu.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking ruangan berhasil diajukan.')),
    );

    Navigator.pop(context);
  }

  String get formattedDate {
    if (selectedDate == null) return 'Pilih tanggal rapat';

    final date = selectedDate!;
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Booking')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.meeting_room_rounded,
                  color: Colors.white,
                  size: 36,
                ),
                const SizedBox(height: 14),
                Text(
                  widget.room.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${widget.room.location} • Kapasitas ${widget.room.capacity} orang',
                  style: const TextStyle(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _InputLabel(label: 'Tanggal Rapat'),
          const SizedBox(height: 8),
          InkWell(
            onTap: _pickDate,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today_rounded),
                  const SizedBox(width: 12),
                  Text(formattedDate),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _InputLabel(label: 'Jam Mulai'),
          const SizedBox(height: 8),
          _BookingTextField(
            controller: startTimeController,
            hint: 'Contoh: 09:00',
            icon: Icons.access_time_rounded,
          ),
          const SizedBox(height: 16),
          _InputLabel(label: 'Jam Selesai'),
          const SizedBox(height: 8),
          _BookingTextField(
            controller: endTimeController,
            hint: 'Contoh: 10:30',
            icon: Icons.access_time_filled_rounded,
          ),
          const SizedBox(height: 16),
          _InputLabel(label: 'Agenda Rapat'),
          const SizedBox(height: 8),
          _BookingTextField(
            controller: agendaController,
            hint: 'Contoh: Rapat monitoring progres aplikasi',
            icon: Icons.event_note_rounded,
          ),
          const SizedBox(height: 16),
          _InputLabel(label: 'Jumlah Peserta'),
          const SizedBox(height: 8),
          _BookingTextField(
            controller: participantController,
            hint: 'Contoh: 12',
            icon: Icons.groups_rounded,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 26),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: _submitBooking,
              icon: const Icon(Icons.check_circle_rounded),
              label: const Text('Ajukan Booking'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputLabel extends StatelessWidget {
  final String label;

  const _InputLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _BookingTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;

  const _BookingTextField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
