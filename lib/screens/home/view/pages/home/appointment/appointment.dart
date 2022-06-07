import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/screens/home/view/pages/home/appointment/cubit/appointment_cubit.dart';
import 'package:emed/services/hive_service.dart';
import 'package:emed/widgets/alertdialog/alert_dialog_widget.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/drop_dow_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppointmentCubit(), child: scafold(context));
  }

  Scaffold scafold(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppointmentCubit, BookingState>(
        builder: (context, state) {
          var data = context.watch<AppointmentCubit>();
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
                                items: data.regions)),
                        const Text('District', style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose hospital district...',
                                items: data.district)),
                        const Text('Hospital', style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose doctor’s workplace...',
                                items: data.hospital)),
                        const Text('Doctor’s position',
                            style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose doctor’s position...',
                                items: data.doctorposition)),
                        const Text('The doctor', style: FStyles.headline4sbold),
                        SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                                text: 'Choose the doctor you want...',
                                items: data.doctorname)),
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
                            DatePicker.showDatePicker(
                                minTime: DateTime.now(),
                                currentTime: DateTime.now(),
                                onConfirm: (time) => showModalBottomSheet(
                                    context: context,
                                    builder: (constext) {
                                      return Container(
                                        padding: EdgeInsets.all(15.0),
                                        height: constext.h * 0.5,
                                        color: ColorConst.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppBarWidget(
                                              leading: BackButtonWidgets(
                                                ontap: () =>
                                                    Navigator.pop(context),
                                              ),
                                              center: Text(
                                                '${time.month} | ${time.day} | ${time.year}',
                                                style: FStyles.headline3s,
                                              ),
                                            ),
                                            const Text(
                                              'CHOOSE TIME',
                                              style: FStyles.headline4s,
                                            ),
                                            Container(
                                              height: context.h * 0.35,
                                              color: ColorConst.kPrimaryColor,
                                              child: GridView.builder(
                                                  itemCount: data.times.length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 10,
                                                    crossAxisSpacing: 10,
                                                  ),
                                                  itemBuilder: (__, _) {
                                                    return InkWell(
                                                        onTap: () =>
                                                            context
                                                                .read<
                                                                    AppointmentCubit>()
                                                                .collectInfo(
                                                                    data.times[
                                                                        _],
                                                                    [
                                                                  time.day,
                                                                  time.month
                                                                ]),
                                                        child: Chip(
                                                          label: Text(
                                                              '${data.times[_][0].toString()} : ${data.times[_][1].toString()}'),
                                                        ));

                                                    // Text(data.times[0][_]);
                                                  }),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                context,
                                theme: DatePickerTheme(
                                    containerHeight: context.h * 0.4,
                                    backgroundColor: ColorConst.white,
                                    headerColor: ColorConst.white));
                          },
                          child: SizedBox(
                            height: context.h * 0.1,
                            child: DropDownWidget(
                              text: 'DD.MM.YYYY / HH:MM - HH:MM',
                              items: [],
                            ),
                          ),
                        ),
                        SizedBox(height: context.h * 0.01),
                        ButtonWidgets(
                          height: context.h * 0.07,
                          child: const Text('Confirm'),
                          onPressed: () async {
                            await context.read<AppointmentCubit>().addInfo(
                                data.meetings);
                                AlertDialogWidget.alertDialogWidget(time: DateTime(DateTime.now().year, data.month, data.day).toString(), name: data.doctorname[data.index], context: context, ontap:(){ Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);});
                            print(data.meetings);
                            print("Box ${BoxService.instance.inputInfoBox.getAt(0)}");
                          },
                        ),
                        SizedBox(height: context.h * 0.01),
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
