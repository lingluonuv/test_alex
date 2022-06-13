
import 'package:developer_alex/common/Themes/colors.dart';
import 'package:developer_alex/common/extensions/color.dart';
import 'package:developer_alex/common/layout/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'not_found_controller.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotFoundController>(init: NotFoundController(),builder: (controller){
      return Scaffold(
        backgroundColor: ThemeColors.primary,
        body: Center(child: Column(
          children: [
            Text('404 Not Found',style: ThemeColors.ff333333.ts(20,fontWeight:FontWeight.bold),),
            Spacing.vs(10),
            InkWell(
              onTap: controller.backToWelcomePage,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: ThemeColors.ff1c9941,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Back',style: ThemeColors.white.ts(16,),),
              ),
            ),
          ],
        ),),
      );
    });
  }
}
