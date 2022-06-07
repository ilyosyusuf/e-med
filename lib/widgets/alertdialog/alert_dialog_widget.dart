import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/constants/font/radius_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget {
  static void alertDialogWidget({required String time,required String name,required BuildContext context,required VoidCallback ontap }) {
    showDialog(
        barrierColor: ColorConst.grey.withOpacity(0.5),
        context: context,
        builder: (context) => AlertDialog(
              title: IconConst.done,
              insetPadding: EdgeInsets.symmetric(vertical: context.h * 0.25),
              actionsAlignment: MainAxisAlignment.center,
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'You have successfully booked\nan appointment',
                      style: FStyles.headline4sbold,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'You can go to $name\n on ${time.substring(0,10)}',
                      style: FStyles.headline4s,
                      textAlign: TextAlign.center,
                    ),
                    ButtonWidgets(
                        onPressed: ontap,
                        child: const Text('Go home'))
                  ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RadiusConst.medium)),
              backgroundColor: ColorConst.white,
            ));
  }
}