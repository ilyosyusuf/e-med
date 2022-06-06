import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/model/doctors_model.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../cubit/home_cubit.dart';

class DoctorInfoView extends StatelessWidget {
  DoctorsModel info;
  DoctorInfoView({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: context.h,
              child: Column(
                children: [
                  AppBarWidget(
                    leading: BackButtonWidgets(ontap: () {
                      context.read<HomeCubit>().changeState(HospitalState());
                    }),
                    center: Text(
                      info.name,
                      style: FStyles.headline4sbold,
                    ),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(info.image),
                  ),
                  SizedBox(
                    height: context.w * 0.06,
                  ),
                  Text("${info.name}", style: FStyles.headline3s),
                  SizedBox(
                    height: context.w * 0.02,
                  ),
                  Text("${info.spes}", style: FStyles.headline4s),
                  // TextWidget.textwidget(info.spes,
                  //     color: ColorConst.blackfortext,
                  //     fontWeight: FontWeight.normal,
                  //     size: 16),
                  SizedBox(
                    height: context.w * 0.04,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: context.w * 0.04),
                    width: context.w * 0.893,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Place of work',
                          style: FStyles.headline4s,
                        ),
                        SizedBox(height: context.h * 0.02),
                        Text(
                          info.info[0].workPlace,
                          style: FStyles.headline3s,
                        ),
                        SizedBox(height: context.h * 0.06),
                        const Text(
                          'Work Locations',
                          style: FStyles.headline4s,
                        ),
                        SizedBox(height: context.h * 0.02),
                        Text(
                          info.info[0].workLocation,
                          style: FStyles.headline3s,
                        ),
                        SizedBox(height: context.h * 0.06),
                        const Text(
                          'Available time',
                          style: FStyles.headline4s,
                        ),
                        SizedBox(height: context.h * 0.01),
                        Text(
                          info.info[0].workingDay,
                          style: FStyles.headline2s,
                        ),
                        SizedBox(height: context.h * 0.01),
                        Text(
                          info.info[0].workingHour,
                          style: FStyles.headline3s,
                        ),
                        SizedBox(height: context.h * 0.06),
                        const Text(
                          'Rating',
                          style: FStyles.headline4s,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: context.w * 0.043),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: context.w *
                                            info.info[0].rating *
                                            0.08425,
                                        height: context.w * 0.13,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, ind) {
                                            return Container(
                                                margin: EdgeInsets.only(
                                                    right: context.w * 0.037),
                                                height: 20,
                                                width: 20,
                                                child: IconConst.star);
                                          },
                                          itemCount: info.info[0].rating,
                                        ),
                                      ),
                                      Container(
                                        width: context.w *
                                            (5 - info.info[0].rating) *
                                            0.08425,
                                        height: context.w * 0.13,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, ind) {
                                            return Container(
                                                margin: EdgeInsets.only(
                                                    right: context.w * 0.037),
                                                height: 20,
                                                width: 20,
                                                child: IconConst.stargrey);
                                          },
                                          itemCount: 5 - info.info[0].rating,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: ButtonWidgets(
            height: context.h * 0.07,
            child: Text('booking', style: FStyles.headline3s),
            onPressed: () {}));
  }

  ListTile listTile(String title, {Widget? subtitle}) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle,
    );
  }
}
