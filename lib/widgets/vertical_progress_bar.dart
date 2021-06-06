import 'package:banking_app_ui/colors/colors.dart';
import 'package:flutter/material.dart';

class VerticalProgressBars extends StatefulWidget {
  @override
  _VerticalProgressBarsState createState() => _VerticalProgressBarsState();
}

class _VerticalProgressBarsState extends State<VerticalProgressBars>
    with TickerProviderStateMixin {
  Animation _progressAnimation;
  AnimationController _animationController;

  List<double> progresses = [210, 140, 40, 15, 24, 53, 200, 12, 43, 10];

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..forward();
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                if (_progressAnimation.isCompleted)
                  _animationController.reverse();
                else
                  _animationController.forward();
              },
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height / 2,
                ),
                painter:
                    MyProgressPainter(_progressAnimation.value, progresses),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyProgressPainter extends CustomPainter {
  final double _progress;
  final List<double> progresses;

  MyProgressPainter(this._progress, this.progresses);

  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;
    var numbersOfbar = width / 9;

    var midHeigth = height / 2;

    var currentX = 0.0;
    var currentY = height;

    var bars = Paint()
      ..color = AppColor.primaryColorLight.withOpacity(0.1)
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var filledBars = Paint()
      ..shader = LinearGradient(colors: [Colors.pink, Colors.purple])
          .createShader(
              Rect.fromCircle(center: Offset(width / 3, width), radius: width))
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 10; i++) {
      canvas.drawLine(Offset(currentX, 0), Offset(currentX, currentY), bars);
      canvas.drawLine(
          Offset(currentX, midHeigth),
          Offset(currentX, midHeigth + (_progress * (progresses[i] / 2))),
          filledBars);
      canvas.drawLine(
          Offset(currentX, midHeigth),
          Offset(currentX, midHeigth - (_progress * (progresses[i] / 2))),
          filledBars);

      currentX += numbersOfbar;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
