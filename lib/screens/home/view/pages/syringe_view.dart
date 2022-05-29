// import 'package:emed/core/constants/colors/color_const.dart';
// import 'package:emed/core/constants/font/font_style.dart';
// import 'package:flutter/material.dart';

// class SyringeView extends StatefulWidget {
//   const SyringeView({Key? key}) : super(key: key);

//   @override
//   State<SyringeView> createState() => _SyringeViewState();
// }

// class _SyringeViewState extends State<SyringeView> with TickerProviderStateMixin{
//   TabController? _controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = TabController(length: 3, vsync: this);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//               SafeArea(
//                 child: Column(
//                   children: [
//                     TabBarView(
//                       controller: _controller,
//                       children: [
//                       Container(color: Colors.yellow),
//                       Container(color: Colors.yellow),
//                       Container(color: Colors.yellow),
//                     ]),
//                   ],
//                 ),
//               ),
            
//           // bottomNavigationBar: tabBar(),
//     );
    
//   }
//   // TabBar tabBar() => TabBar(
//   //   controller: _controller,
    
//   //   indicatorColor: ColorConst.kPrimaryColor,
//   //   labelColor: ColorConst.kPrimaryColor,
//   //   unselectedLabelColor: ColorConst.grey,
//   //   tabs: [
      
//   //   Tab(icon: Text("Current tratment", style: FStyles.headline4s,)),
//   //   Tab(child: Text("Medical history",style: FStyles.headline4s,),),
//   //   Tab(child: Text("Drug history", style: FStyles.headline4s,),),
//   // ]);
// }
