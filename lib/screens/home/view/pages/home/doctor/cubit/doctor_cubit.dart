import 'package:bloc/bloc.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:emed/screens/home/state/home_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorState(dataList: HomeCubit.dataList));

  Set temp = {};

  void searchDoctor(String text) {
    temp.clear();
    for (var i = 0; i < HomeCubit.dataList[0].length; i++) {
      if (text.isEmpty) {
        temp.clear();
        emit(DoctorState(dataList:HomeCubit.dataList));
      } else if (HomeCubit.dataList[0][i]['name']
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        temp.add(HomeCubit.dataList[0][i]);
        emit(DoctorState(dataList:HomeCubit.dataList));
      }
    }
  }
}