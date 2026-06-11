import 'package:flutter/material.dart';

import '../features/activities/screens/activity_detail_screen.dart';
import '../features/activities/screens/activity_list_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/notifications/screens/notification_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/meeting_rooms/screens/meeting_room_menu_screen.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String activities = '/activities';
  static const String activityDetail = '/activity-detail';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String meetingRooms = '/meeting-rooms';

  static Map<String, WidgetBuilder> routes = {
    dashboard: (_) => const DashboardScreen(),
    activities: (_) => const ActivityListScreen(),
    activityDetail: (_) => const ActivityDetailScreen(),
    notifications: (_) => const NotificationScreen(),
    profile: (_) => const ProfileScreen(),
    meetingRooms: (_) => const MeetingRoomMenuScreen(),
  };
}
