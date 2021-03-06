import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              AppBarWidget(
                leading: InkWell(
                    onTap: () => context.read<HomeCubit>().changeState(HospitalState()),
                    child: const Text(
                      'Cancel',
                      style: FStyles.headline3blue,
                    )),
                center: const Text(
                  'Filter',
                  style: FStyles.headline3s,
                ),
                trailing: SizedBox(width: 50.0,),
              ),
               ExpansionTile(
                title: const Text(
                  'Positions',
                  style: FStyles.headline3s,
                ),
                children: [
                  SizedBox(
                    height: context.h * 0.5,
                    child: ListView.builder(
                        itemCount: HomeCubit.dataList[0].length,
                        itemBuilder: (__,_) {
                          return ListTile(
                            leading: Checkbox(
                              onChanged: (v) {},
                              value: true,
                            ),
                            title: Text(HomeCubit.dataList[0][_]['expert'],),
                          );
                        },),
                  )
                ],
              ),
              ExpansionTile(
                title: const Text(
                  'Regions',
                  style: FStyles.headline3s,
                ),
                children: [
                  SizedBox(
                    height: context.h * 0.5,
                    child: ListView.builder(
                        itemCount: HomeCubit.dataList[0].length,
                        itemBuilder: (__,_) {
                          return ListTile(
                            leading: Checkbox(
                              onChanged: (v) {},
                              value: true,
                            ),
                            title: Text(HomeCubit.dataList[0][_]['region'],),
                          );
                        },),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),);
  }
}
