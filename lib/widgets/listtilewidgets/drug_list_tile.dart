import 'package:emed/core/constants/font/font_style.dart';
import 'package:flutter/material.dart';

class DrugListTileWidget extends StatelessWidget {
  String? title;
  String? mg;
  String? fromdo;
  DrugListTileWidget({
    Key? key,
    this.title,
    this.mg,
    this.fromdo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            this.title.toString(),
            style: FStyles.headline3s,
          ),
          subtitle: Text(
            this.mg.toString(),
            style: FStyles.headline4s,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.chevron_right_rounded),
              Text(
                this.fromdo.toString(),
                style: FStyles.headline52,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
