import 'package:flutter/material.dart';

import '../controllers/home_page_controller.dart';

class ButtonArea extends StatelessWidget {
  String title;
   ButtonArea({
    super.key,
    required this.c,
     required this.title,
  });

  final HomePageController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      child: ElevatedButton(onPressed: ()
      {
        c.saveOrUpdateTodo();
      },
        child: Center(
          child: Text(title),
        ),),
    );
  }
}

