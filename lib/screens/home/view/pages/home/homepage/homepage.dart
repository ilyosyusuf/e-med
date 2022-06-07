import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/screens/home/view/pages/doctor/widget/doctor_widget.dart';
import 'package:emed/services/hive_service.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:emed/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(
                  trailing: IconConst.notificate,
                  leading: Icon(Icons.person),
                  center: SizedBox(
                      height: context.h * 0.025,
                      width: context.w * 0.3,
                      child: IconConst.logo),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today’s medications',
                        style: FStyles.headline5s,
                      ),
                      SizedBox(
                        height: context.h * 0.1,
                      ),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              'No medications',
                              style: FStyles.headline2s,
                            ),
                            SizedBox(height: context.h * 0.040),
                            const Text(
                              'They will appear here only when doctor\nadds them to your account.',
                              style: FStyles.headline4s,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.h * 0.1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Monthly appointments',
                          style: FStyles.headline5s,
                        ),
                        CalendarWidget(
                          onTap: (day) {
                            Navigator.pushNamed(context, '/appointment');
                          },
                        ),
                        SizedBox(height: context.h * 0.04),
                        const Text(
                          'Today\'s appointments',
                          style: FStyles.headline5s,
                        ),
                        SizedBox(
                          height: context.h * 0.1,
                        ),
                        SizedBox(
                          height: context.h * 0.4,
                          child: BoxService.instance.inputInfoBox.isNotEmpty
                              ? ListView.builder(
                                  itemCount:
                                      BoxService.instance.inputInfoBox.length,
                                  itemBuilder: (_, __) {
                                    return 
                                    // DateTime(
                                    //             2022,
                                    //             BoxService.instance.inputInfoBox
                                    //                 .getAt(__)!['date'][0],
                                    //             BoxService.instance.inputInfoBox
                                    //                 .getAt(__)!['date'][1]) ==
                                    //         DateTime.now()
                                    //     ? 
                                        DoctorsWidget(
                                            hospital: BoxService
                                                .instance.inputInfoBox
                                                .getAt(__)!['hospital'].toString(),
                                            expert: BoxService
                                                .instance.inputInfoBox
                                                .getAt(
                                                    __)!['position'].toString(),
                                            pic: BoxService
                                                .instance.inputInfoBox
                                                .getAt(__)!['picture']
                                                .toString(),
                                            name: BoxService
                                                .instance.inputInfoBox
                                                .getAt(__)!['doctor']
                                                .toString());
                                        // : SizedBox();
                                  })
                              : Center(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'No appointments',
                                        style: FStyles.headline2s,
                                      ),
                                      SizedBox(height: context.h * 0.040),
                                      const Text(
                                        "You haven't added any appointment yet",
                                        style: FStyles.headline4s,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: context.h * 0.1,
                        ),
                        SizedBox(height: context.h * 0.040),
                        Center(
                          child: ButtonWidgets(
                              height: context.h * 0.07,
                              child: const Text('Add new appointment',
                                  style: FStyles.headline3s),
                              onPressed: () {}),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
