import 'doctor.dart';

class Schedule {
  final Doctor doctor;
  final String status;
  final DateTime time;

  Schedule({
    required this.doctor,
    required this.status,
    required this.time,
  });
}

List<Schedule> schedules = [
  Schedule(
      doctor: doctors[4],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-03')),
  Schedule(
      doctor: doctors[0],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-04')),
  Schedule(
      doctor: doctors[1],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-05 09:30')),
  Schedule(
      doctor: doctors[2],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-01 06:00')),
  Schedule(
    doctor: doctors[3],
    status: 'Confirmed',
    time: DateTime.parse('2024-11-06 15:45'),
  ),
];

List<String> tabs = ['Upcoming', 'Completed', 'Canceled'];

// Filter schedules for today
List<Schedule> todaySchedules = schedules
    .where((schedule) =>
        schedule.time.year == DateTime.now().year &&
        schedule.time.month == DateTime.now().month &&
        schedule.time.day == DateTime.now().day)
    .toList();

// Filter schedules for future dates
List<Schedule> futureSchedules = schedules
    .where((schedule) => schedule.time.isAfter(DateTime.now()))
    .toList();

// Filter schedules for past dates
List<Schedule> pastSchedules = schedules
    .where((schedule) => schedule.time.isBefore(DateTime.now()))
    .toList();
