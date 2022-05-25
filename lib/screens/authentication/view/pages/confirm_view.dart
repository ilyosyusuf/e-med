
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:emed/widgets/numinputwidget/num_input_widget.dart';
import 'package:flutter/material.dart';

class ConFirmationView extends StatelessWidget {
  const ConFirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidgets(
          child: const Text('Confirm'),
          onPressed: () {}),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(),
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