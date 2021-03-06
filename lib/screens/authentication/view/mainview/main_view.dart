import 'package:emed/core/base/base_view.dart';
import 'package:emed/screens/authentication/cubit/auth_cubit.dart';
import 'package:emed/screens/authentication/state/auth_state.dart';
import 'package:emed/screens/authentication/view/pages/confirm_view.dart';
import 'package:emed/screens/authentication/view/pages/personal_id_view.dart';
import 'package:emed/screens/authentication/view/pages/signin_view.dart';
import 'package:emed/screens/authentication/view/pages/signup_page.dart';
import 'package:emed/screens/authentication/view/pages/splash_view.dart';
import 'package:emed/screens/authentication/view/pages/start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAuthView extends StatelessWidget {
  const MainAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> AuthCubit(),
    child: authScaffold(),

    );
  }

  Scaffold authScaffold() {
    return Scaffold(
    body:
     BaseView( viewModel: MainAuthView, OnPageBuilder: (context, widget){
       return        BlocConsumer<AuthCubit, AuthState>(
        listener: ((context, state) {
          
        }),
        builder: (context, state){
          if(state is AuthSplash){
            return const SplashView();
          } else if(state is AuthInitial){
            return const StartView();
          } else if(state is AuthSignUP){
            return SignUpView();
          } else if(state is AuthSignIn){
            return SignInView();
          } else if(state is AuthConfirmation){
            return ConFirmationView();
          } else if(state is AuthID){
            return PersonalIdView();
          } else{
            return Container();
          }
        },
         );
     },

     )
  );
  }
}