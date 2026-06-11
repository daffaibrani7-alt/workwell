import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          CircleAvatar(
            radius: 42,
            backgroundColor: AppColors.primary,
            child: Icon(Icons.person_rounded, size: 48, color: Colors.white),
          ),
          SizedBox(height: 18),
          Center(
            child: Text(
              'Daffa Ibrani',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Text(
              'Pranata Komputer Ahli Pertama',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          SizedBox(height: 28),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.badge_rounded),
            title: Text('Unit Kerja'),
            subtitle: Text('Badan Pembinaan Hukum Nasional'),
          ),
        ],
      ),
    );
  }
}
