import 'package:developer_alex/common/Themes/colors.dart';
import 'package:developer_alex/pages/welcome/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:developer_alex/common/extensions/color.dart';
import '../../common/Themes/colors.dart';

class WelComePage extends StatelessWidget {
  const WelComePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelComeController>(
      init: WelComeController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: _WavePaint(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 114),
                child: Image.asset(
                  'assets/images/icon_welcome.png',
                  height: 77,
                  width: 236,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: controller.toTeamPage,
                child: Container(
                  margin: EdgeInsets.only(bottom: 200 + Get.mediaQuery.padding.bottom),
                  padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 11),
                  decoration: BoxDecoration(color: const Color(0xffffffff), borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'View More !',
                    style: ThemeColors.dark.ts(14,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WavePaint extends CustomPaint {
  @override
  CustomPainter? get painter => _WavePainter();
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xff1c9941)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path();

    List points = [
      const Offset(0, 340),
      const Offset(4, 340),
      const Offset(135, 400),
      Offset(Get.width - 20, 272),
      Offset(Get.width, 272),
    ];

    addBezierPathWithPoints(path, points);

    path.lineTo(Get.width, Get.height);
    path.lineTo(0, Get.height);
    path.lineTo(0, 340);

    canvas.drawPath(path, paint);
  }

  void addBezierPathWithPoints(Path path, List points) {
    for (int i = 0; i < points.length - 1; i++) {
      Offset current = points[i];
      Offset next = points[i + 1];
      if (i == 0) {
        path.moveTo(current.dx, current.dy);
        // control point
        double ctrlX = current.dx + (next.dx - current.dx) / 2;
        double ctrlY = next.dy;
        path.quadraticBezierTo(ctrlX, ctrlY, next.dx, next.dy);
      } else if (i < points.length - 2) {
        // control point 1
        double ctrl1X = current.dx + (next.dx - current.dx) / 2;
        double ctrl1Y = current.dy;
        // control point 2
        double ctrl2X = ctrl1X;
        double ctrl2Y = next.dy;
        path.cubicTo(ctrl1X, ctrl1Y, ctrl2X, ctrl2Y, next.dx, next.dy);
      } else {
        path.moveTo(current.dx, current.dy);
        // control point
        double ctrlX = current.dx + (next.dx - current.dx) / 2;
        double ctrlY = current.dy;
        path.quadraticBezierTo(ctrlX, ctrlY, next.dx, next.dy);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
