import 'package:emed/core/components/box_full_decoration.dart';
import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ShowModalWidget {
  static Future<dynamic> showModal(BuildContext context, String title, String mg) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxAllDecoration.decor(ColorConst.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(""),
                      ),
                      Spacer(),
                      Text(title, style: FStyles.headline3s),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok", style: FStyles.headline3blue),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 1),
                SizedBox(height: context.h * 0.01),
                Text("Drug name"),
                SizedBox(height: context.h * 0.005),
                Text(title, style: FStyles.headline3s),
                SizedBox(height: context.h * 0.01),
                Text("Dose"),
                SizedBox(height: context.h * 0.005),
                Text(mg, style: FStyles.headline3s),
                SizedBox(height: context.h * 0.01),
                Text("Taking dates (start-end)"),
                SizedBox(height: context.h * 0.005),
                Text("20.05.2022 - 30.05.2022", style: FStyles.headline3s),
                SizedBox(height: context.h * 0.01),
                Text("How many times"),
                SizedBox(height: context.h * 0.005),
                Text("2 times a day", style: FStyles.headline3s),
                SizedBox(height: context.h * 0.01),
                Text("Associated with"),
                SizedBox(height: context.h * 0.005),
                Text("Multiple scleroris", style: FStyles.headline3s),
                SizedBox(height: context.h * 0.01),
                Text("Comments"),
                SizedBox(height: context.h * 0.005),
                Text("Consume without water. It lessens the affect",
                    style: FStyles.headline3s),
              ],
            ),
          ),
        );
      },
    );
  }
}
