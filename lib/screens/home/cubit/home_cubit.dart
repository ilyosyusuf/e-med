import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:emed/model/doctors_info_model.dart';
import 'package:emed/model/doctors_model.dart';
import 'package:emed/model/hospital_model.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/services/get_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as bundle;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Homemain());

  static List dataList = [];

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
      emit(DoctorState(dataList: dataList));
    } else if (index == 3) {
      currentpage = index;
      emit(HospitalState());
    }
  }

  Future<List> getData() async {
    final data = await bundle.rootBundle.loadString('lib/core/mock/mock_data.json');
    final list = jsonDecode(data) as List;
    // debugPrint(list.toString());
    dataList.add(list);
    DoctorState(dataList: dataList);
    return list;
  }

  changeToHinfo(HospitalModel info) {
    emit(HospitalInfoState(info));
  }

  changeToDinfo(DoctorsModel info) {
    emit(DoctorsInfoState(info));
  }

  Set<HospitalModel> temp = {};

  void searching(String text) {
    temp.clear();
    for (var i = 0; i < hinfo.length; i++) {
      if (text.isEmpty) {
        temp.clear();
        emit(HospitalState());
      } else if (hinfo[i]
          .name
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        temp.add(hinfo[i]);
        emit(HospitalState());
      }
    }
  }

  pickMeeting(String value) {}

  List<HospitalModel> hinfo = [
    HospitalModel(
      "assets/images/hospitals/hospitalone.png",
      "Uzbekistan New International Clinic",
      "Tashkent, Shaykhontokhur, Navoi street",
      "+998 97 210 11 12",
      "Monday - Saturday",
      "10:00 - 16:00",
      "See on google maps",
      "tashclink.org",
      [
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi",
              2,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
      ],
    ),
    HospitalModel(
      "assets/images/hospitals/hospitaltwo.png",
      "Tashkent international",
      "Tashkent, Shaykhontokhur, Navoi street",
      "+998 97 210 11 12",
      "Monday - Saturday",
      "10:00 - 16:00",
      "See on google maps",
      "tashclink.org",
      [
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
      ],
    ),
    HospitalModel(
      "assets/images/hospitals/hospitalthree.png",
      "Uzbekistan New International Clinic",
      "Tashkent, Shaykhontokhur, Navoi street",
      "+998 97 210 11 12",
      "Monday - Saturday",
      "10:00 - 16:00",
      "See on google maps",
      "tashclink.org",
      [
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
      ],
    ),
    HospitalModel(
      "assets/images/hospitals/hospitalfour.png",
      "Uzbekistan New International Clinic",
      "Tashkent, Shaykhontokhur, Navoi street",
      "+998 97 210 11 12",
      "Monday - Saturday",
      "10:00 - 16:00",
      "See on google maps",
      "tashclink.org",
      [
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
      ],
    ),
    HospitalModel(
      "assets/images/hospitals/hospitalfive.png",
      "Uzbekistan New International Clinic",
      "Tashkent, Shaykhontokhur, Navoi street",
      "+998 97 210 11 12",
      "Monday - Saturday",
      "10:00 - 16:00",
      "See on google maps",
      "tashclink.org",
      [
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
        DoctorsModel("assets/images/doctors/doctor.png", "Mavlonov Boburjon",
            "Pediatric Pulmonolog", [
          DoctorsInfoModel(
              "Uzbekistan New International Clinic",
              "Tashkent, Shaykhontokhur, Navoi street",
              4,
              "Monday - Saturday",
              "10:00 - 16:00")
        ]),
      ],
    ),
  ];
}
