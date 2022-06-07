import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:emed/core/icons/icon_const.dart';
import 'package:emed/screens/home/cubit/home_cubit.dart';
import 'package:emed/screens/home/state/home_state.dart';
import 'package:emed/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HospitalSearchView extends StatelessWidget {
  HospitalSearchView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var temp = context.watch<HomeCubit>().temp;
    var hinfo = context.watch<HomeCubit>().hinfo;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                trailing: IconConst.notificate,
                leading: Icon(IconConst.person),
                center: SizedBox(
                    height: context.h * 0.025,
                    width: context.w * 0.3,
                    child: IconConst.logo),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 18, bottom: 10),
                child: SizedBox(
                  height: 36,
                  child: CupertinoSearchTextField(onChanged: (text){
                      context.read<HomeCubit>().searching(text);

                  },)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: context.w * 0.05,
                    top: context.w * 0.04,
                    bottom: context.w * 0.04),
                child: const Text(
                  "Recommended hospitals for you",
                  style: FStyles.headline4s
                ),
              ),
              context.watch<HomeCubit>().temp.isEmpty
                  ? Expanded(
                      child: ListView.builder(
                      itemBuilder: (ctx, ind) {
                        return Column(
                          children: [
                            InkWell(
                              child: Container(
                                  width: context.w * 0.893,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        child: FadeInImage(
                                          fit: BoxFit.cover,
                                          placeholder: const AssetImage(
                                              'assets/gifs/loading.gif'),
                                          image: AssetImage(hinfo[ind].image),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        child: SizedBox(
                                          width: context.w * 0.28,
                                          child: Chip(
                                              label: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/calendar.svg'),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Text("Mon - Sat"),
                                            ],
                                          )),
                                        ),
                                      ),
                                      Positioned(
                                        left: 139,
                                        child: SizedBox(
                                          width: context.w * 0.32,
                                          child: Chip(
                                            label: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/clock.svg'),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text("9:00 - 18:00")
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              onTap: () {
                                context
                                    .read<HomeCubit>()
                                    .changeState(HospitalInfoState(hinfo[ind]));
                              },
                            ),
                            Text("${hinfo[ind].name}", style: FStyles.headline3s),
                            
                            Text(context.watch<HomeCubit>().hinfo[ind].location, style: FStyles.headline52),
                            SizedBox(height: context.h * 0.03),
                          ],
                        );
                      },
                      itemCount: hinfo.length,
                    ))
                  : Expanded(
                      child: ListView.builder(
                      itemBuilder: (ctx, ind) {
                        return Column(
                          children: [
                            InkWell(
                              child: SizedBox(
                                  width: context.w * 0.893,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        child: FadeInImage(
                                          fit: BoxFit.cover,
                                          placeholder: const AssetImage(
                                              'assets/gifs/loading.gif'),
                                          image: AssetImage(
                                              temp.toList()[ind].image),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        child: SizedBox(
                                          width: context.w * 0.28,
                                          child: Chip(
                                              label: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/calendar.svg'),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Text("Mon - Sat"),
                                            ],
                                          )),
                                        ),
                                      ),
                                      Positioned(
                                        left: 139,
                                        child: SizedBox(
                                          width: context.w * 0.32,
                                          child: Chip(
                                            label: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/clock.svg'),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                const Text("9:00 - 18:00")
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              onTap: () {
                                context
                                    .read<HomeCubit>()
                                    .changeState(HospitalInfoState(hinfo[ind]));
                              },
                            ),
                            Text("${temp.toList()[ind].name}", style: FStyles.headline3s,),
                            Text(temp.toList()[ind].location, style: FStyles.headline52,)
                          ],
                        );
                      },
                      itemCount: temp.length,
                    ))
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecarartion() {
    return const InputDecoration(
      hintText: "Search hospital",
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      suffixIcon: Icon(Icons.search),
    );
  }
}
