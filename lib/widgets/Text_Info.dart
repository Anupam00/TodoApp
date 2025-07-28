import 'package:flutter/material.dart';

class Text_Info extends StatelessWidget {
  String title;
  FontWeight fontWeight;
  double fontsize;
  Color color;
   Text_Info({
    super.key,
     required  this.title,
     required this.fontWeight,
     required this.fontsize,
     required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontsize,
        color: color,
      ),
    );
  }
}
