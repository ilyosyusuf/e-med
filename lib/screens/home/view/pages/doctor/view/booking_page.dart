
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/home/view/pages/doctor/widget/doctor_widget.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:emed/widgets/buttons/back_button.dart';
import 'package:emed/widgets/buttons/drop_dow_button.dart';
import 'package:emed/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';


class BookingPage extends StatelessWidget {
  final Map info;
  const BookingPage({required this.info,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidgets(child: const Text('Confirm', style: FStyles.headline3s), onPressed: (){}),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
                center: const Text('Book an appointment', style: FStyles.headline3s,),
                leading: BackButtonWidgets(
              ontap: () => Navigator.pop(context),
            )),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Appointment to:', style: FStyles.headline4s,),
                  SizedBox(height: context.h * 0.02),
                  DoctorsWidget(pic: info['user_image'], name: '${info['name']} at', expert: info['expert'], hospital: info['place_work'],),
                  SizedBox(height: context.h * 0.07,),
                  Text('Service type', style: FStyles.headline4s,),
                  SizedBox(height: context.h * 0.1,child: DropDownWidget(items: [],text: 'Choose doctor\'s service type...',)),
                  SizedBox(height: context.h * 0.04,),
                  Text('Enter time', style: FStyles.headline4s,),
                  SizedBox(height: context.h * 0.1,child: DropDownWidget(items: [],text: 'DD.MM.YYYY / HH:MM - HH:MM',))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
