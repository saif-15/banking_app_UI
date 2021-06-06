import 'package:banking_app_ui/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  int currentIndex = 1;
  final Function onTap;
  final List<BottomBarItem> items;

  BottomBar({Key key, this.onTap, this.items})
      : assert(items != null, "Items should be provided atleast 1"),
        super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  int selectedIndex = 0;
  Animation _scaleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..forward();
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: AppColor.primaryColorLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildBottomBarItems(_scaleAnimation.value),
            ),
          );
        });
  }

  List<Widget> _buildBottomBarItems(double value) {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.items.length; i++) {
      var item = widget.items[i];
      bool isSelected = selectedIndex == i;
      widgets.add(GestureDetector(
        onTap: () {
          _animationController.reset();
          _animationController.forward();
          setState(() {
            selectedIndex = i;
          });
          widget.onTap(selectedIndex);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: value.abs() * 60,
            width: value.abs() * 60,
            decoration: isSelected
                ? BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: AppColor.orange, blurRadius: 30),
                    ],
                    backgroundBlendMode: BlendMode.darken,
                    gradient: LinearGradient(colors: [
                      AppColor.primaryColorDark,
                      AppColor.primaryColorLight
                    ], begin: Alignment.topCenter),
                    borderRadius: BorderRadius.circular(45),
                  )
                : null,
            child: Icon(
              item.icon,
              size: isSelected ? value.abs() * 30 : 30,
              color: isSelected ? AppColor.orange : Colors.white30,
            ),
          ),
        ),
      ));
    }
    return widgets;
  }
}

class BottomBarItem {
  final IconData icon;
  final String title;

  BottomBarItem({this.icon, this.title});
}
