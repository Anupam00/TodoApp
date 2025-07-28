import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/home_page_controller.dart';
import '../utils/colors.dart';
import '../widgets/Text_Info.dart';
import '../widgets/buttons.dart';
import '../widgets/textfield.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.c,
  });

  final HomePageController c;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Text_Info(title: "What are you planning to do today ?",
              fontWeight: FontWeight.w600,
              fontsize: 20,
              color: AppColors.labelColor,
          ),
          SizedBox(height: 40,),
          TextFieldArea(c: c,title: "Enter Tasks",),
          SizedBox(height: 15,),
          ButtonArea(c: c,title: "Save"),
        ],
      ),
    );
  }
}
