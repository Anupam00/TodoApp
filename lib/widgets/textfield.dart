import 'package:flutter/material.dart';

import '../controllers/home_page_controller.dart';
import '../utils/colors.dart';

class TextFieldArea extends StatelessWidget {
  String title;
   TextFieldArea({
    super.key,
    required this.c,
     required this.title,
  });

  final HomePageController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        controller: c.tc ,
        minLines: 1,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 10,color: AppColors.inputBorderColor,),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 1.5,color: AppColors.registerNowColor,),
          ),
          hintText: title,
          label: Text(title),
        ),
      ),
    );
  }
}