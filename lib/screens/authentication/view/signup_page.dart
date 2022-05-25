import 'package:emed/core/components/check_validator.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:emed/widgets/textformwidget/text_form_widget.dart';
import 'package:flutter/material.dart';

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
                children: [AppBarWidget(), Divider(thickness: 1)],
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
                              validator: CheckValidator.phoneValidator
                              ),
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
                          MyTextField.textField(
                              text: "Enter your new password...",
                              controller: passwordController,
                              validator: CheckValidator.passwordValidator,
                              iconButton: IconButton(
                                  onPressed: () {
                                    // remove_red_eye icon will be worked with cubit
                                  },
                                  icon: Icon(Icons.remove_red_eye))),
                          const Spacer(),
                          ButtonWidgets(
                            child: Text("Continue"),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // next page will be emited this position
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
