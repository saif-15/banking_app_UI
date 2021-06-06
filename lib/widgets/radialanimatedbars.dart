import 'package:banking_app_ui/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialAnimatedBars extends StatefulWidget {
  const RadialAnimatedBars({Key key}) : super(key: key);

  @override
  _RadialAnimatedBarsState createState() => _RadialAnimatedBarsState();
}

class _RadialAnimatedBarsState extends State<RadialAnimatedBars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.primaryColorLight,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: CustomPaint(
              painter: MyAnimatedRadialPainter(),
              child: Container(
                width: 230,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Orders",
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "4,80k",
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.orange,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            height: 80,
            width: 20,
          )
        ],
      ),
    );
  }
}

class MyAnimatedRadialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    var radius = width / 2 - 30;

    var filledPercentage = 0.5;

    final center = Offset(width / 2, height / 2);

    final blackPaint = Paint()
      ..color = AppColor.primaryColorDark
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final filledPaint = Paint()
      ..shader = LinearGradient(colors: [AppColor.orange, AppColor.yelloOrange])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    for (var i = 1; i <= 3; i++) {
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          math.radians(-180), math.radians(180), false, blackPaint);

      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          math.radians(-180),
          math.radians(filledPercentage * 180),
          false,
          filledPaint);
      radius = radius - 20;
      filledPercentage = filledPercentage + 0.15;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
