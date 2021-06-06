import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  final double width;
  final double height;

  const Clock({Key key, this.width, this.height}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Timer.periodic(Duration(microseconds: 100), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: CustomPaint(
        size: Size(widget.width, widget.height),
        painter: MyClockPainter(),
      ),
    );
  }
}

class MyClockPainter extends CustomPainter {
  var time = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 100;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    var circlePainter = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    var outlineCircle = Paint()
      ..color = Colors.black26
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    var innerCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24;

    var secondHand = Paint()
      ..shader = LinearGradient(
              colors: [Colors.blue, Colors.blueAccent, Colors.black45])
          .createShader(
              Rect.fromCircle(center: Offset(centerX, centerY), radius: radius))
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    var minuteHand = Paint()
      ..shader = LinearGradient(colors: [Colors.red, Colors.redAccent])
          .createShader(
              Rect.fromCircle(center: Offset(centerX, centerY), radius: radius))
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    var hourHAnd = Paint()
      ..shader = LinearGradient(colors: [Colors.green, Colors.greenAccent])
          .createShader(
              Rect.fromCircle(center: Offset(centerX, centerY), radius: radius))
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(centerX, centerY), radius + 10, outlineCircle);
    canvas.drawCircle(Offset(centerX, centerY), radius, circlePainter);

    var secondX = centerX + radius * 0.8 * cos(time.second * 6 * pi / 180);
    var secondY = centerX + radius * 0.8 * sin(time.second * 6 * pi / 180);

    var minuteX = centerX + radius * 0.6 * cos(time.minute * 6 * pi / 180);
    var minuteY = centerX + radius * 0.6 * sin(time.minute * 6 * pi / 180);

    var hourX = centerX +
        radius * 0.4 * cos((time.hour * 30 + time.minute * 0.5) * pi / 180);
    var hourY = centerX +
        radius * 0.4 * sin((time.hour * 30 + time.minute * 0.5) * pi / 180);

    var outlines = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawLine(
        Offset(centerX, centerY), Offset(minuteX, minuteY), minuteHand);
    canvas.drawLine(Offset(centerX, centerY), Offset(hourX, hourY), hourHAnd);
    canvas.drawLine(
        Offset(centerX, centerY), Offset(secondX, secondY), secondHand);

    for (var i = 0; i <= 360; i += 6) {
      var endX = 0.0;
      var endY = 0.0;

      if (i % 90 == 0) {
        endX = centerX + (radius + 50) * cos(i * pi / 180);
        endY = centerX + (radius + 50) * sin(i * pi / 180);
      } else {
        endX = centerX + (radius + 40) * cos(i * pi / 180);
        endY = centerX + (radius + 40) * sin(i * pi / 180);
      }
      var startX = centerX + (radius + 30) * cos(i * pi / 180);
      var startY = centerX + (radius + 30) * sin(i * pi / 180);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), outlines);
    }

    canvas.drawCircle(Offset(centerX, centerY), 2, innerCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
