import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
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
                      )
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
                          onTap: (day) {},
                        ),
                        SizedBox(height: context.h * 0.010),
                        const Text(
                          'Today\'s appointments',
                          style: FStyles.headline5s,
                        ),
                        Container(
                          height: context.h * 0.4,
                          color: ColorConst.kPrimaryColor,
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
