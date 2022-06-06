import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/model/hospital_model.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/screens/home/view/pages/hospital/doctor_info_view.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalInfoView extends StatelessWidget {
  HospitalModel info;
  HospitalInfoView({Key? key, required this.info}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: context.h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarWidget(
                trailing: InkWell(child: IconConst.filter, onTap: (){
                  context.read<HomeCubit>().changeState(FilterStateHospital());
                },) ,
                leading: InkWell(
                  child: const Icon(Icons.chevron_left) ,
                  onTap: () {
                    context.read<HomeCubit>().changeState(HospitalState());
                  },
                ),
                center: Text("Hospital", style: FStyles.headline3s,),
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(info.image),
              ),
              Text("${info.name}", style: FStyles.headline3s),
              SizedBox(
                width: context.w * 0.893,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text("Phone number"),
                      subtitle: Text(info.phoneNumber),
                      trailing: Image.asset("assets/images/phone.png"),
                    ),
                    listTile("Working time",
                        Text("${info.workingDay} \n${info.workingHour}")),
                    listTile(
                      "Location Link",
                      Text(
                        info.locationLink,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    listTile(
                      "Website",
                      Text(
                        "tashclinic.org",
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text("Doctors at Hospital", style: FStyles.headline3s),
                    SizedBox(
                      height: context.h * 0.7,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, ind) {
                          return ListTile(
                            trailing: InkWell(
                              child: Icon(Icons.chevron_right),
                              onTap: () {
                                context.read<HomeCubit>().changeToDinfo(info.dInfo[ind]);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> DoctorInfoView(info: info.dInfo[ind])));
                              },
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage(info.dInfo[ind].image),
                            ),
                            title: Text(info.dInfo[ind].name),
                            subtitle: Text(info.dInfo[ind].spes),
                          );
                        },
                        itemCount: info.dInfo.length,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  ListTile listTile(String title, Text subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle,
    );
  }
}
