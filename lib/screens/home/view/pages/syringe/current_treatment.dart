import 'package:emed/config/init/navigation/navigator.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/screens/home/view/pages/syringe/treatment_details.dart';
import 'package:emed/widgets/listtilewidgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurrentTreatment extends StatelessWidget {
  const CurrentTreatment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Current treatment
        body: SafeArea(
          child: Column(
              children: [
          Expanded(
              child: Column(
                children: [
                  ListTileWidget(title: "Aortic Aneurysm", subtitle1: "Ma'murov Abbos", subtitle2: "Family Clinic No42",),
                  ListTileWidget(title: "Fibromyalgiya", subtitle1: "Nazirov Muxtor", subtitle2: "Family Clinic No42",),
                ],
              ))
              ],
            ),
        ));
  }
}
