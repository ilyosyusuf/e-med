import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingService extends CalendarDataSource {
  MeetingService(List<Appointment> data) {
    appointments = data;
  }
}