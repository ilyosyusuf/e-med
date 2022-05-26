import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/authentication/cubit/auth_cubit.dart';
import 'package:emed/screens/authentication/state/auth_state.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 313,
          child: Center(
  child: Image.asset('assets/images/startlogo.png'),
          ),
        ),
        Expanded(
            flex: 687,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Your medical data is always with you", style: FStyles.headline1s, textAlign: TextAlign.center,)
                ),
                SizedBox(height: context.h * 0.024,),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Nunc orci sed sed posuere volutpat varius egestas sit. Amet, suscipit eget dis fusce quam in aliquet pulvinar.", style: FStyles.headline4s, textAlign: TextAlign.center,),),
                const Spacer(),
                Center(child: ButtonWidgets(
                  height: context.h * 0.07,
                  child: Text("Get Started"), onPressed: (){
                    context.read<AuthCubit>().changeState(AuthSignUP());
                  }),),
                SizedBox(height: context.h * 0.024,),
                Center(child: ButtonWidgets(
                  height: context.h * 0.07,
                  backgroundColor: Colors.white,
                  borderColor: ColorConst.kPrimaryColor,
                  child: Text("Log In", style: FStyles.headline3blue,), onPressed: (){
                    context.read<AuthCubit>().changeState(AuthSignIn());
                  }),),
                SizedBox(height: context.h * 0.04,),

              ],
            ))
      ]),
    );
  }
}