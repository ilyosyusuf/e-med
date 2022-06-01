import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/screens/home/view/pages/home/treatments/details/treatment_details.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String? title;
  String? subtitle1;
  String? subtitle2;
  ListTileWidget({
    Key? key,
    this.title,
    this.subtitle1,
    this.subtitle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (__)=> TreatmentDetailsView(name: subtitle1.toString(), clinic: subtitle2.toString())));
          },
          title: Text(
        this.title.toString(),
        style: FStyles.headline3s,
          ),
          subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.subtitle1.toString(),
            style: FStyles.headline4s,
          ),
          Text(
            this.subtitle2.toString(),
            style: FStyles.headline6s,
          ),
        ],
          ),
          trailing: Icon(Icons.chevron_right_rounded),
        ),
        Divider(thickness: 1,)
      ],
    );
  }
}
