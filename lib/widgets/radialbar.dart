import 'package:banking_app_ui/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialBar extends StatefulWidget {
  const RadialBar({Key key}) : super(key: key);

  @override
  _RadialBarState createState() => _RadialBarState();
}

class _RadialBarState extends State<RadialBar>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onHorizontalDragStart: (details) {
            Navigator.of(context).pop();
          },
          child: Container(
              width: 35,
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.orange,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Icon(Icons.arrow_back_ios)),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              gradient: LinearGradient(colors: [
                AppColor.primaryColorDark,
                AppColor.primaryColorLight
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Text(
                  "Earnings",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "\$${507.8}k",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "Profile in 20% more than last month",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: MyRadialPainter(_animation.value),
                        child: Container(
                          height: 300,
                          width: 400,
                          child: Center(
                            child: Text(
                              "40%",
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyRadialPainter extends CustomPainter {
  final double value;

  MyRadialPainter(this.value);
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final circleRadius = width / 2 - 10;
    final radius = width / 2 - 40;

    var stArc = Paint()
      ..color = AppColor.primaryColorLight
      ..strokeWidth = 50
      ..style = PaintingStyle.stroke;
    final center = Offset(width / 2, height / 2);

    var sndArc = Paint()
      ..shader = LinearGradient(
              colors: [AppColor.orange, AppColor.yelloOrange, AppColor.orange],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 80
      ..style = PaintingStyle.stroke;

    var thrdArc = Paint()
      ..color = AppColor.primaryColorDark
      ..strokeWidth = 60
      ..style = PaintingStyle.stroke;

    var criclePaint = Paint()
      ..shader = LinearGradient(
              colors: [AppColor.primaryColorDark, AppColor.primaryColorLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(Rect.fromCircle(center: center, radius: width / 2))
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, circleRadius, criclePaint);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 20),
        math.radians(-90), math.radians(90 * value), false, stArc);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 15),
        math.radians(0), math.radians(90 * value), false, sndArc);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 15),
        math.radians(180), math.radians(90 * value), false, thrdArc);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 20),
        math.radians(90), math.radians(90 * value), false, stArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
