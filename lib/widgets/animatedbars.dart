import 'package:banking_app_ui/colors/colors.dart';
import 'package:flutter/material.dart';

class AnimatedBar extends StatefulWidget {
  final AnimatedBarModel model;
  const AnimatedBar({Key key, this.model}) : super(key: key);

  @override
  _AnimatedBarsState createState() => _AnimatedBarsState();
}

class _AnimatedBarsState extends State<AnimatedBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  //   size: Size(30, 150),
                  painter: BarPainter(
                      widget.model.color, widget.model.value, _animation.value),
                  child: Container(
                    width: 30,
                    height: 150,
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              maxRadius: 10,
              backgroundColor: widget.model.color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.model.month,
              style: TextStyle(color: widget.model.color),
            )
          ],
        ),
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double value;

  BarPainter(this.color, this.value, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final paint = Paint()
      ..shader = LinearGradient(colors: [
        color,
        AppColor.primaryColor,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          .createShader(Rect.fromCenter(
              center: Offset(value / 2, height / 2),
              width: width,
              height: height))
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    canvas.drawLine(
        Offset(10, height), Offset(10, progress * value * 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedBarModel {
  final Color color;
  final String month;
  final double value;

  AnimatedBarModel(this.color, this.month, this.value);
}
