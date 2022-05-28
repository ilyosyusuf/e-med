import 'package:emed/core/components/box_only_decoration.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/screens/authentication/cubit/auth_cubit.dart';
import 'package:emed/screens/authentication/state/auth_state.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalIdView extends StatelessWidget {
  const PersonalIdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: ButtonWidgets(
            child: const Text('Go to your account'),
            height: context.h * 0.07,
            onPressed: () {
              // go to next pages
            }),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  AppBarWidget(
                    center: Text("Your Personal ID"),
                    leading: BackButtonWidgets(ontap: () {
                      context.read<AuthCubit>().changeState(AuthSignIn());
                    }),
                  ),
                  Divider(thickness: 1)
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.h * 0.1,
                    ),
                    Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/idmain.png')),
                    SizedBox(height: context.h * 0.04),
                    Text(
                      "Doctors use your ID to have an access to your medical informations. We have sent this ID and your password to your number so you don’t forget them",
                      style: FStyles.headline4s,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.h * 0.04),
                    Container(
                        width: context.w,
                        child: Text("Your ID", style: FStyles.headline3s)),
                    SizedBox(height: context.h * 0.01),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: context.h * 0.07,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              alignment: Alignment.centerLeft,
                              // id code will come from backend
                              child:
                                  Text("12345678", style: FStyles.headline4s),
                              decoration: BoxOnlyDecoration.decor(
                                  Colors.grey.shade100,
                                  topLeft: 10.0,
                                  bottomLeft: 10.0)),
                        ),
                        InkWell(
                          child: Container(
                              height: context.h * 0.07,
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text("Copy", style: FStyles.headline3s),
                                  IconConst.copy,
                                ],
                              ),
                              decoration: BoxOnlyDecoration.decor(Colors.white,
                                  topRight: 10.0, bottomRight: 10.0)),
                          onTap: () {
                            // ID code will be copied
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
