import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarWidgets extends StatelessWidget {
  const NavigationBarWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: ((value) {
          context.read<HomeCubit>().changePage(value);
        }),
        currentIndex: context.watch<HomeCubit>().currentpage,
        backgroundColor: ColorConst.grey,
        items: [
          BottomNavigationBarItem(
              icon: IconConst.home, tooltip: 'Home', label: ''),
          BottomNavigationBarItem(
              icon: IconConst.syringe, tooltip: 'Syringe', label: ''),
          BottomNavigationBarItem(
              icon: IconConst.doctor, tooltip: 'Doctors', label: ''),
          BottomNavigationBarItem(
              icon: IconConst.hospital, tooltip: 'Hospital', label: ''),
        ]);
  }
}