import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TodoApp/utils/colors.dart';
import 'package:TodoApp/widgets/Text_Info.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';
import '../widgets/bottomsheet.dart';
import '../widgets/buttons.dart';
import '../widgets/textfield.dart';

class Todos extends StatelessWidget {
  const Todos({super.key,
    required this.c,});

  final HomePageController c;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 7,),
                Text_Info(title: "SN", fontWeight: FontWeight.w600, fontsize: 20, color: AppColors.textColor),
                SizedBox(width: 30,),
                Text_Info(title: "Activities", fontWeight: FontWeight.w600, fontsize: 20, color: AppColors.textColor),
                SizedBox(width: 100,),
                Text_Info(title: "Settings", fontWeight: FontWeight.w600, fontsize: 20, color: AppColors.textColor),
              ],
            ),
            SizedBox(height: 15,),
      
            Expanded(
              child:
              Obx(()=>
              ListView.builder(
                shrinkWrap: true,
                  itemCount: c.todoActivities.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading:
                          Text_Info(
                              title: "${index+1}",
                              fontWeight: FontWeight.w200,
                              fontsize: 15,
                              color: AppColors.secondaryTextColor,
                          ),
                      title: Text_Info(
                        title: "${c.todoActivities[index]['body']}",
                        fontWeight: FontWeight.w200,
                        fontsize: 15,
                        color: AppColors.secondaryTextColor,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.edit,
                              color: AppColors.editColor,
                            ),
                            onTap: (){
                              c.prepareUpdate((index));
                              Get.bottomSheet(
                                BottomSheetArea(c: c),
                              );
                            },
                          ),
                          SizedBox(width: 20,),
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              color: AppColors.deleteColor,
                            ),
                            onTap: (){
                              c.deleteTodo(index);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
              ),
            ),
          ],
        ),
      ),
        Positioned(
          bottom: 80, // distance from bottom of screen
          right: 20,  // distance from right
          child: FloatingActionButton(
            onPressed: () {
              c.changeIndex(0);
            },
            child: Icon(Icons.add),
          ),
        ),
    ]
    );
  }
}