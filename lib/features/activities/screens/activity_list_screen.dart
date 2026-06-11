import 'package:flutter/material.dart';

import '../../../app/routes.dart';

class ActivityListScreen extends StatelessWidget {
  const ActivityListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      'Monitoring progres pengembangan sistem',
      'Dokumentasi one click install ILDIS',
      'Review desain aplikasi WorkWell',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: activities.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            title: Text(
              activities[index],
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: const Text('Status: Berjalan'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.activityDetail);
            },
          );
        },
      ),
    );
  }
}
