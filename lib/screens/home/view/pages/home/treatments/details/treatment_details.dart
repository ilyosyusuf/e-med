import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/listtilewidgets/more_list_tile_widget.dart';
import 'package:flutter/material.dart';

class TreatmentDetailsView extends StatelessWidget {
  String name;
  String clinic;
  TreatmentDetailsView({Key? key, required this.name, required this.clinic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
                center: Text(
                  "Treatment details",
                  style: FStyles.headline3s,
                ),
                
                leading: BackButtonWidgets(ontap: () {
                  Navigator.pop(context);
                },
                ),
                trailing: SizedBox(width: context.w * 0.15,)
                ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage:
                          NetworkImage('https://source.unsplash.com/random'),
                    ),
                    SizedBox(height: context.h * 0.01),
                    Text(name, style: FStyles.headline3s),
                    Text("Dermotologist"),
                    SizedBox(height: context.h * 0.03),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SizedBox(
                        width: context.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Clinic"),
                            Text(clinic, style: FStyles.headline3s),
                            SizedBox(height: context.h * 0.03),
                            Text("Clinic location"),
                            Text("Shaykhontakhur district, st.",
                                style: FStyles.headline3s),
                            Text("Zulfiyakhonim, 18 Tashkent, 100128",
                                style: FStyles.headline3s),
                            SizedBox(height: context.h * 0.03),
                            Text("Start date"),
                            Text("20.11.2021", style: FStyles.headline3s),
                            SizedBox(height: context.h * 0.03),
                            Text("Complaints"),
                            Text("Redness on the skin",
                                style: FStyles.headline3s),
                            SizedBox(height: context.h * 0.03),
                            Text("Diagnosis"),
                            Text("Skin psoriasis", style: FStyles.headline3s),
                            SizedBox(height: context.h * 0.03),
                            Text("Treatment"),
                            Text("Diet, Ozone therapy / 6 days,",
                                style: FStyles.headline3s),
                            Text("tivortin 100.0 / 6 days",
                                style: FStyles.headline3s),
                            SizedBox(height: context.h * 0.03),
                            Text("Analysis"),
                            Text("blood, urine, ultrasound, hormones",
                                style: FStyles.headline3blue),
                            SizedBox(height: context.h * 0.03),
                            Text("Drugs being taken"),
                            MoreListTileWidget(
                              title: "Salicylic",
                              mg: "150 mg",
                            ),
                            MoreListTileWidget(
                              title: "Calcipotriol",
                              mg: "500 mg",
                            ),
                            MoreListTileWidget(
                              title: "Tazorac",
                              mg: "100 mg",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
