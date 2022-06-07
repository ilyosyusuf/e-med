import 'package:emed/core/components/check_validator.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/mask/text_input_mask.dart';
import 'package:emed/screens/authentication/cubit/auth_cubit.dart';
import 'package:emed/screens/authentication/state/auth_state.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:emed/widgets/textformwidget/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  // all formfields will be come from cubit
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  AppBarWidget(
                    center: Text("Log In"),
                    leading: BackButtonWidgets(ontap: () {
                      context.read<AuthCubit>().changeState(AuthInitial());
                    }),
                  ),
                  Divider(thickness: 1)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: context.h * 0.88,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.h * 0.04),
                          const Center(
                            child: Text('Log in to your account',
                                style: FStyles.headline4s,
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(height: context.h * 0.04),
                          SizedBox(height: context.h * 0.04),
                          const Text("Phone number", style: FStyles.headline3s),
                          SizedBox(height: context.h * 0.01),
                          MyTextField.textField(
                              text: "Enter your phone number...",
                              controller: phoneController,
                              inputFormatters: [TextInputMask.phoneMaskFormatter],
                              validator: CheckValidator.phoneValidator),
                          SizedBox(height: context.h * 0.04),
                          const Text("Your password",
                              style: FStyles.headline3s),
                          SizedBox(height: context.h * 0.01),
                          StatefulBuilder(builder: (context, setState) {
                            return MyTextField.textField(
                                text: "Enter your new password...",
                                controller: passwordController,
                                validator: CheckValidator.passwordValidator,
                                isShown: context.watch<AuthCubit>().getShown,
                                iconButton: IconButton(
                                    onPressed: () {
                                      context.read<AuthCubit>().obSecure();
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.remove_red_eye)));
                          }),
                          SizedBox(height: context.h * 0.04),
                          ButtonWidgets(
                            child: Text("Continue"),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                              }
                            },
                            width: context.w,
                            height: context.h * 0.07,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
