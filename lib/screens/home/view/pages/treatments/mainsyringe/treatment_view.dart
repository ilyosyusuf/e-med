import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/screens/home/view/pages/treatments/pagestreatment/current_treatment.dart';
import 'package:emed/screens/home/view/pages/treatments/pagestreatment/drug_history.dart';
import 'package:emed/screens/home/view/pages/treatments/pagestreatment/medical_history.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TreatmentView extends StatefulWidget {
  const TreatmentView({Key? key}) : super(key: key);

  @override
  State<TreatmentView> createState() => _TreatmentViewState();
}

class _TreatmentViewState extends State<TreatmentView> with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              trailing: IconConst.notificate,
              leading: Icon(Icons.person),
              center: SizedBox(
                  height: context.h * 0.025,
                  width: context.w * 0.3,
                  child: IconConst.logo),
            ),
            SizedBox(
              height: context.h * 0.05,
              child: tabBar()),
            Expanded(
              child: SizedBox(
                
                child: TabBarView(
                  controller: _controller,
                  children: [
                    CurrentTreatment(),
                    MedicalHistory(),
                    DrugHistory(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  TabBar tabBar()=>TabBar(
    controller: _controller,
    indicatorColor: ColorConst.kPrimaryColor,
    labelColor: ColorConst.kPrimaryColor,
    unselectedLabelColor: ColorConst.grey,
    tabs: [
    Tab(icon: Text("Current treatment")),
    Tab(icon: Text("Medical history")),
    Tab(icon: Text("Drug history")),
  ]);
}
