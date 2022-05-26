import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_size.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  String text;
  AppBarWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Row(
              children: [
                Icon(Icons.chevron_left_outlined, size: FSize.extraLarge, color: ColorConst.kPrimaryColor,),
                // IconConst.backarrow,
                Text("Back", style: FStyles.headline3blue, ),
              ],
            ),
            onTap: (){
              //previous page will be emitted this position
            },
          ),

          Spacer(),
          Text(text, style: FStyles.headline2s),
          Spacer(),
          SizedBox(width: context.w * 0.2,)
        ],
      ),
    );
  }
}