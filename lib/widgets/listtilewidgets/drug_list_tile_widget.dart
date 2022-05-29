import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/widgets/showmodal/showmodal_widget.dart';
import 'package:flutter/material.dart';

class DrugListTileWidget extends StatelessWidget {
  String title;
  String mg;
  DrugListTileWidget({
    Key? key,
    required this.title,
    required this.mg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(title, style: FStyles.headline3s),
              Spacer(),
              Text(
                mg,
                style: FStyles.headline4s,
              ),
            ],
          ),
          trailing: SizedBox(
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.chevron_right_rounded)),
          ),
          onTap: () {
            ShowModalWidget.showModal(context, title, mg);
          },
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
