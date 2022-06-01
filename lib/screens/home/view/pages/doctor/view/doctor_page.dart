import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/constants/font/radius_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/screens/home/view/pages/doctor/cubit/doctor_cubit.dart';
import 'package:emed/screens/home/view/pages/doctor/widget/doctor_widget.dart';
import 'package:emed/screens/home/view/pages/doctor/widget/new_doctors_widget.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorPage extends StatelessWidget {
  final List datainfo;
  const DoctorPage({required this.datainfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: scafold(context),
    );
  }

  Scaffold scafold(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DoctorCubit, DoctorState>(builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  AppBarWidget(
                    leading: Icon(IconConst.person),
                    trailing: InkWell(
                        onTap: () {
                          // NavigationService.instance.pushNamed('/filter');
                          // Navigator.pushNamed(context, '/filter');
                        },
                        child: IconConst.filter),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CupertinoSearchTextField(onChanged: (text) {
                          context.read<DoctorCubit>().searchDoctor(text);
                        }),
                        SizedBox(
                          height: context.h * 0.020,
                          child: const Divider(
                            color: ColorConst.black,
                          ),
                        ),
                        context.watch<DoctorCubit>().temp.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Recommended doctors for you',
                                    style: FStyles.headline5s,
                                  ),
                                  SizedBox(height: context.h * 0.020),
                                  SizedBox(
                                    height: context.h * 0.5,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: datainfo[0].length - 1,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                          
                                            child: SizedBox(
                                              height: context.h * 0.130,
                                              child: NewDoctorsWidget(
                                                  pic: datainfo[0][index]
                                                          ['user_image']
                                                      .toString(),
                                                  name: datainfo[0][index]
                                                          ['name']
                                                      .toString()),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: context.h * 0.020,
                                  ),
                                  const Text(
                                    'List of doctors',
                                    style: FStyles.headline5s,
                                  ),
                                  SizedBox(
                                    height: context.h * 0.04,
                                  ),
                                  SizedBox(
                                    height: context.h * 0.60,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: datainfo[0].length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                            },
                                            child: NewDoctorsWidget(
                                                pic: datainfo[0][index]
                                                        ['user_image']
                                                    .toString(),
                                                name: datainfo[0][index]['name']
                                                    .toString()),
                                          );
                                        }),
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: context.h * 0.9,
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: context
                                        .watch<DoctorCubit>()
                                        .temp
                                        .length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                         
                                        },
                                        child: NewDoctorsWidget(
                                            pic: context
                                                .watch<DoctorCubit>()
                                                .temp
                                                .toList()[index]['user_image']
                                                .toString(),
                                            name: context
                                                .watch<DoctorCubit>()
                                                .temp
                                                .toList()[index]['name']
                                                .toString()),
                                      );
                                    }),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
