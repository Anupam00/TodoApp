import 'package:flutter/material.dart';
import 'package:TodoApp/widgets/textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/home_page_controller.dart';
import '../utils/colors.dart';
import 'Text_Info.dart';
import 'buttons.dart';

class BottomSheetArea extends StatelessWidget {
  const BottomSheetArea({
    super.key,
    required this.c,
  });

  final HomePageController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/2,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Text_Info(
            title: "Edit Your Task",
            fontWeight: FontWeight.w700,
            fontsize: 20, color: AppColors.editColor,
          ),
          SizedBox(height: 30,),
          TextFieldArea(c: c,title: "Update Tasks",),
          SizedBox(height: 15,),
          ButtonArea(c: c,title: "Update"),
        ],
      ),
    );
  }
}
