import 'package:flutter/material.dart';
import 'package:TodoApp/controllers/home_page_controller.dart';
import 'package:TodoApp/utils/colors.dart';
import 'package:TodoApp/widgets/Text_Info.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/buttomnavigation.dart';

class HomePage extends StatelessWidget {
  final c = Get.put(HomePageController());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text_Info(
                title: "Todo App",
                fontWeight: FontWeight.w700,
                fontsize: 20,
                color: AppColors.headingTextColor,
            ),
          )
        ),
      ),
      bottomNavigationBar:
           BottomNavigationArea(c: c),
      body:
           Obx(()=>c.changeNavigation()),
    );
  }
}
