import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';
import '../utils/colors.dart';

class BottomNavigationArea extends StatelessWidget {
  const BottomNavigationArea({
    super.key,
    required this.c,
  });

  final HomePageController c;

  @override
  Widget build(BuildContext context) {
    return 
      Obx(()=>
      BottomNavigationBar(
      onTap: (index){
        c.changeIndex(index);
      },
      backgroundColor: AppColors.bottomNavigationColor,
        selectedFontSize: 15,
        iconSize: 25,
      selectedItemColor: AppColors.backgroundColor,
      currentIndex: c.currentIndex.value,
      items: List.generate(c.pages.length, (index){
        final page = c.pages[index];
        return BottomNavigationBarItem(
          icon: page["icons"],
          label: page["label"],
        );
      }
      ),
    ),
      );
  }
}