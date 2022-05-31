import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/services/get_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/services.dart' as bundle;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Homemain());

  static List dataList = [];

  List<String> regions = [
    'Tashkent',
    'Namangan',
    'Andijan',
    'Fargana',
    'Xorazm',
    'Samarqand',
    'Buxoro',
    'Navoiy',
    'Jizzax',
    'Qashqadaryo',
    'Surxandaryo',
    'Qora qalpogiston'
  ];

  List<String> district = [
    'Chilonzor',
    'Mirzo Ulugbek',
    'Sergili',
    'Yakka Saroy',
    'Shayxontohur',
    'Olmazor'
  ];

  CalendarView calendarView = CalendarView.month;

  changeTypeCalendat() {
    calendarView = CalendarView.week;
    emit(BookingState());
  }

  List<String> time = ["9 : 00", "12 : 00", "4 : 00", "8 : 00"];

  String? selectedValue;

  addInfo(List item, String value) async {
    if (item[0] == 'Tashkent') {
      debugPrint(item.toString());
      await Storageservice.instance.storage.write('location', value);
      debugPrint('${Storageservice.instance.storage.read('location')}');
    }
  }

  pickValue(String value) {
    selectedValue = value;
    emit(BookingState());
  }

  int currentpage = 0;

  changeState(HomeState state) {
    emit(state);
  }

  changePage(int index) {
    if (index == 0) {
      currentpage = index;
      emit(Homemain());
    } else if (index == 1) {
      currentpage = index;
      emit(SyringeState());
    } else if (index == 2) {
      currentpage = index;
      emit(DoctorState());
    } else if (index == 3) {
      currentpage = index;
      emit(HospitalState());
    }
  }

  Future<List> getData()async{
    final data = await bundle.rootBundle.loadString('lib/core/mock/mock_data.json');
    final list = jsonDecode(data) as List;
    // debugPrint(list.toString());
    dataList.add(list);
    return list;
  }

  pickMeeting(String value) {}
}
