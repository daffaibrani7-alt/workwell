class MeetingRoom {
  final String name;
  final String location;
  final int capacity;
  final bool isAvailable;
  final String description;

  const MeetingRoom({
    required this.name,
    required this.location,
    required this.capacity,
    required this.isAvailable,
    required this.description,
  });
}