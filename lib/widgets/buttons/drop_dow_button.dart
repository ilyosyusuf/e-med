import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropDownWidget extends StatelessWidget {
  List items = [];
  DropDownWidget({Key? key, required this.items}) : super(key: key);
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: const [
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.kPrimaryColor
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                // setState(() {
                //   selectedValue = value as String;
                // });
              },
              icon: const Icon(
                Icons.arrow_drop_down
              ),
              iconSize: 25,
              iconDisabledColor: Colors.grey,
              buttonHeight: context.h * 0.08,
              buttonWidth: context.w,
              buttonPadding: const EdgeInsets.only(left: 20, right: 20),
    
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: ColorConst.white,
              ),
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 200,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                
              ),
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-20, 0),
            ),
          ),
    );
  }
}