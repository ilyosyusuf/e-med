import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/services/get_storage_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  final void Function(CalendarTapDetails)? onTap;
  const CalendarWidget({required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      firstDayOfWeek: 6,
      onTap: onTap,
      todayHighlightColor: ColorConst.red,
      showCurrentTimeIndicator: true,
      onViewChanged: ((viewChangedDetails) {
        debugPrint(viewChangedDetails.toString());
      }),
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      view: CalendarView.month,
    );
  }
}