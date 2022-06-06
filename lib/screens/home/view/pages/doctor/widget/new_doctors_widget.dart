import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/constants/font/radius_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:flutter/material.dart';

class NewDoctorsWidget extends StatelessWidget {
  final String name;
  final String pic;
  const NewDoctorsWidget({required this.pic, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: context.h * 0.02),
        child: Column(children: [
          ListTile(
            trailing: Icon(IconConst.arrow),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(RadiusConst.extraLarge),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/gifs/loading.gif'),
                image: AssetImage(pic),
                height: context.h * 0.15,
                width: context.w * 0.15,
              ),
            ),
            title: Text(
              name,
              style: FStyles.headline3s,
            ),
          ),
          Divider(
            indent: context.w * 0.19,
            color: ColorConst.grey,
          )
        ])
        );
  }
}