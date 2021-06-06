import 'package:banking_app_ui/colors/colors.dart';
import 'package:flutter/material.dart';

class MyCurves extends StatelessWidget {
  const MyCurves({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 160,
      child: CustomPaint(
        painter: MyCurvePainter(),
        child: Container(),
      ),
    );
  }
}

class MyCurvePainter extends CustomPainter {
  MyCurvePainter();
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
              colors: [AppColor.orange, AppColor.yelloOrange, AppColor.orange])
          .createShader(Rect.fromLTRB(0, 0, size.width, size.height))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;
    var path = Path();
    path.moveTo(0, size.height * 0.84);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.3,
        size.width * 0.52, size.height * 0.84);
    path.quadraticBezierTo(
        size.width * 0.6, size.height * 1.2, size.width, size.height * 0.2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
