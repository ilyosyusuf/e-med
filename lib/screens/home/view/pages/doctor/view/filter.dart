import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

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
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'canel',
                      style: FStyles.headline3blue,
                    )),
                center: const Text(
                  'Filter',
                  style: FStyles.headline3s,
                ),
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
                        itemBuilder: (__, _) {
                          return ListTile(
                            leading: Checkbox(
                              onChanged: (v) {},
                              value: true,
                            ),
                            title: Text(HomeCubit.dataList[0][_]['expert']),
                          );
                        }),
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
                        itemBuilder: (__, _) {
                          return ListTile(
                            leading: Checkbox(
                              onChanged: (v) {},
                              value: true,
                            ),
                            title: Text(HomeCubit.dataList[0][_]['region']),
                          );
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
