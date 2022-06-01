import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  final Map info;
  const DoctorInfo({required this.info, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidgets(
          child: const Text(
            'Book an appointment',
            style: FStyles.headline3s,
          ),
          onPressed: () {}
          ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                AppBarWidget(
                  leading: BackButtonWidgets(
                      ontap: () {},
                  ),
                  center: Text(
                    info['name'],
                    style: FStyles.headline3s,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        child: FadeInImage(
                            fit: BoxFit.contain,
                            width: context.w * 0.4,
                            height: context.h * 0.2,
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                            image: AssetImage(info['pic'])),
                      ),
                      SizedBox(height: context.h * 0.02),
                      Text(
                        info['name'],
                        style: FStyles.headline2s,
                      ),
                      SizedBox(height: context.h * 0.01),
                      Text(
                        info['expert'],
                        style: FStyles.headline4s,
                      ),
                      SizedBox(height: context.h * 0.1),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Place of work',
                              style: FStyles.headline4s,
                            ),
                            SizedBox(height: context.h * 0.02),
                            Text(
                              info['place work'],
                              style: FStyles.headline3s,
                            ),
                            SizedBox(height: context.h * 0.06),
                            const Text(
                              'Work Locations',
                              style: FStyles.headline4s,
                            ),
                            SizedBox(height: context.h * 0.02),
                            Text(
                              info['location'],
                              style: FStyles.headline3s,
                            ),
                            SizedBox(height: context.h * 0.06),
                            const Text(
                              'Available time',
                              style: FStyles.headline4s,
                            ),
                            SizedBox(height: context.h * 0.01),
                            Text(
                              info['days'],
                              style: FStyles.headline2s,
                            ),
                            SizedBox(height: context.h * 0.01),
                            Text(
                              '${info['time'][0].toString()} : 00 - ${info['time'][1].toString()} : 00',
                              style: FStyles.headline3s,
                            ),
                            SizedBox(height: context.h * 0.06),
                            const Text(
                              'Rating',
                              style: FStyles.headline4s,
                            ),
                            SizedBox(
                              height: context.h * 0.1,
                                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: info['rating'],itemBuilder: (_, __) {
                                return Icon(IconConst.star, color: ColorConst.kPrimaryColor,);
                              }),
                            ),
                            SizedBox(height: context.h * 0.1,)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
