// import 'package:emed/core/constants/colors/color_const.dart';
// import 'package:emed/core/constants/font/font_size.dart';
// import 'package:emed/core/constants/font/font_style.dart';
// import 'package:emed/core/extensions/context_extension.dart';
// import 'package:emed/core/icons/icon_const.dart';
// import 'package:flutter/material.dart';

// class AppBarWidget extends StatelessWidget {
//   String text;
//   VoidCallback? onPressed;
//   AppBarWidget({
//     Key? key,
//     required this.text,
//     this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: context.h * 0.06,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             child: Row(
//               children: const [
//                 Icon(Icons.chevron_left_outlined, size: FSize.extraLarge, color: ColorConst.kPrimaryColor,),
//                 // IconConst.backarrow,
//                 Text("Back", style: FStyles.headline3blue, ),
//               ],
//             ),
//             onTap: onPressed
//           ),

//           Spacer(),
//           Text(text, style: FStyles.headline2s),
//           Spacer(),
//           SizedBox(width: context.w * 0.2,)
//         ],
//       ),
//     );
//   }
// }

import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final Widget center;
  final Widget leading;
  final Widget trailing;
  const AppBarWidget({
    this.trailing = const SizedBox(),
    required this.leading,
    this.center = const Text('Sign up', style: FStyles.headline3s,),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * 0.07,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading,
            const Spacer(),
            center,
            const Spacer(),
            SizedBox(
              width: context.w * 0.1,
            ),
            trailing
          ],
        ),
        const Divider(
          color: ColorConst.black,
        )
      ]),
    );
  }
}