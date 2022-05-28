import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/authentication/cubit/auth_cubit.dart';
import 'package:emed/screens/authentication/state/auth_state.dart';
import 'package:emed/screens/authentication/view/pages/signin_view.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:emed/widgets/numinputwidget/num_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConFirmationView extends StatelessWidget {
  const ConFirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: ButtonWidgets(
            child: const Text('Confirm'),
            // width: context.w,
            height: context.h * 0.07,
            onPressed: () {
              context.read<AuthCubit>().changeState(AuthID());
            }),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
              center: Text("Sign Up"),
              leading: BackButtonWidgets(ontap: () {
                context.read<AuthCubit>().changeState(AuthSignUP());
              }),
            ),
            SizedBox(height: context.h * 0.060),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: context.w * 0.9,
                      child: const Text(
                        'We sent a confirmation code to your number. Please, enter the code',
                        style: FStyles.headline5s,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: context.h * 0.070),
                  const Text(
                    "Confirmation code",
                    style: FStyles.headline6s,
                  ),
                  SizedBox(height: context.h * 0.040),
                  SizedBox(
                      height: context.h * 0.070,
                      child: Row(
                        children: const [
                          NumberInputWidget(),
                          NumberInputWidget(),
                          NumberInputWidget(),
                          NumberInputWidget(),
                          NumberInputWidget(),
                          NumberInputWidget()
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
