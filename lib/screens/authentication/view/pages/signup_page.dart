import 'package:emed/core/components/check_validator.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/authentication/cubit/auth_cubit.dart';
import 'package:emed/screens/authentication/state/auth_state.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:emed/widgets/textformwidget/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

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
                    center: Text("Sign Up", style: FStyles.headline3s,),
                    leading: BackButtonWidgets(ontap: () {
                      context.read<AuthCubit>().changeState(AuthInitial());
                    }),
                    trailing: SizedBox(width: context.w * 0.15),
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
                          const Text(
                              'Sign up in order to get a full access to the system',
                              style: FStyles.headline4s,
                              textAlign: TextAlign.center),
                          SizedBox(height: context.h * 0.04),
                          const Text("Full name", style: FStyles.headline3s),
                          SizedBox(height: context.h * 0.01),
                          MyTextField.textField(
                              text: "Enter your full name...",
                              controller: nameController,
                              validator: CheckValidator.nameValidator),
                          SizedBox(height: context.h * 0.04),
                          const Text("Phone number", style: FStyles.headline3s),
                          SizedBox(height: context.h * 0.01),
                          MyTextField.textField(
                              text: "Enter your phone number...",
                              controller: phoneController,
                              validator: CheckValidator.phoneValidator),
                          SizedBox(height: context.h * 0.01),
                          const Center(
                            child: Text(
                                "We will send confirmation code to this number",
                                style: FStyles.headline52),
                          ),
                          SizedBox(height: context.h * 0.035),
                          const Text("Create password",
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
                          const Spacer(),
                          ButtonWidgets(
                            child: Text("Continue"),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<AuthCubit>()
                                    .changeState(AuthConfirmation());
                              }
                            },
                            width: context.w,
                            height: context.h * 0.07,
                          ),
                          SizedBox(height: context.h * 0.04),
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
