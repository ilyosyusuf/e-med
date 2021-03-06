import 'package:emed/core/base/base_view_lock.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/screens/home/view/pages/doctor/view/doctor_page.dart';
import 'package:emed/screens/home/view/pages/home/homepage/homepage.dart';
import 'package:emed/screens/home/view/pages/hospital/filter_view.dart';
import 'package:emed/screens/home/view/pages/hospital/hospital_info_page.dart';
import 'package:emed/screens/home/view/pages/hospital/hospital_search.dart';
import 'package:emed/screens/home/view/pages/treatments/mainsyringe/treatment_view.dart';
import 'package:emed/widgets/navigationbar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        var cubit = HomeCubit();
        cubit.getData();
        return cubit;
      },
      child: homeScaffold(),
    );
  }

  Scaffold homeScaffold() => Scaffold(
        bottomNavigationBar: const NavigationBarWidgets(),
        body: BaseViewLock(viewModel: HomeView, onPageBuilder: (context, widget){
          return  BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is Homemain) {
            return const HomePage();
          } else if (state is SyringeState) {
            return Center(
              child: TreatmentView(),
            );
          } else if (state is DoctorState) {
            return DoctorPage(datainfo: state.dataList);
          } else if (state is HospitalState) {
            return HospitalSearchView();
          } else if (state is HospitalInfoState){
            return HospitalInfoView(info: state.hinfo);
          } else if(state is FilterStateHospital){
            return FilterView();
          }
          else if (state is BookingState) {
            return Container();
          } else {
            return Container();
          }
        });
        })

      );
}
