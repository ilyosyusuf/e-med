import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/constants/font/radius_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/services/get_storage_service.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/drop_dow_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(), child: scafold(context));
  }

  Scaffold scafold(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidgets(
        child: const Text('Confirm'),
        onPressed: () {
        },
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                AppBarWidget(
                    trailing: SizedBox(
                      width: context.w * 0.050,
                    ),
                    center: const Text(
                      'Booking an appointment',
                      style: FStyles.headline3s,
                    ),
                    leading: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'cancel',
                          style: FStyles.headline3blue,
                        ))),
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Region', style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose hospital region...',
                                items: context.watch<HomeCubit>().regions)),
                        const Text('District',
                            style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose hospital district...',
                                items: context.read<HomeCubit>().district)),
                        const Text('Hospital',
                            style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose doctor’s workplace...',
                                items: [])),
                        const Text('Doctor’s position',
                            style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose doctor’s position...',
                                items: [])),
                        const Text('The doctor',
                            style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose the doctor you want...',
                                items: [])),
                        const Text('Service type',
                            style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose doctor’s service type...',
                                items: [])),
                        const Text('Enter the time',
                            style: FStyles.headline4sbold),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: EdgeInsets.all(15.0),
                                    margin: EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                        color: ColorConst.white,
                                        borderRadius: BorderRadius.circular(
                                            RadiusConst.medium)),
                                    child: SfCalendar(
                                      view: CalendarView.week,
                                      onTap: (v) {
                                        context
                                            .read<HomeCubit>()
                                            .changeTypeCalendat();
                                      },
                                    ),
                                    // child: CupertinoDatePicker(
                                    //   onDateTimeChanged: (v) async {
                                    //     await Storageservice.instance.storage
                                    //         .write('day', v.day);
                                    //     await Storageservice.instance.storage
                                    //         .write('houre', v.hour);
                                    //     await Storageservice.instance.storage
                                    //         .write('month', v.month);

                                    //     debugPrint(Storageservice
                                    //         .instance.storage
                                    //         .read('month')
                                    //         .toString());
                                    //   },
                                    //   mode: CupertinoDatePickerMode.dateAndTime,
                                    // ),
                                  );
                                });
                          },
                          child: SizedBox(
                              height: context.h * 0.1,
                              child: DropDownWidget(
                                  text: 'DD.MM.YYYY / HH:MM - HH:MM',
                                  items: [])),
                        ),
                        SizedBox(height: context.h * 0.1),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
