import 'package:banking_app_ui/colors/colors.dart';
import 'package:banking_app_ui/widgets/animatedbars.dart';
import 'package:banking_app_ui/widgets/card.dart';
import 'package:banking_app_ui/widgets/radialanimatedbars.dart';
import 'package:banking_app_ui/widgets/radialbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key}) : super(key: key);

  final list = [
    AnimatedBarModel(AppColor.orange, "Jan", 10),
    AnimatedBarModel(AppColor.primaryColorLight, "Feb", 15),
    AnimatedBarModel(AppColor.primaryColorLight, "Mar", 20),
    AnimatedBarModel(AppColor.orange, "Apr", 10),
    AnimatedBarModel(AppColor.orange, "May", 12),
    AnimatedBarModel(AppColor.primaryColorLight, "Jun", 40),
    AnimatedBarModel(AppColor.orange, "Jul", 32),
    AnimatedBarModel(AppColor.primaryColorLight, "Aug", 22),
    AnimatedBarModel(AppColor.orange, "Sep", 25),
    AnimatedBarModel(AppColor.orange, "Oct", 30),
    AnimatedBarModel(AppColor.primaryColorLight, "Nov", 10),
    AnimatedBarModel(AppColor.primaryColorLight, "Dec", 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              colors: [
                                AppColor.primaryColorDark,
                                AppColor.primaryColor
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        AppColor.primaryColorDark,
                        AppColor.primaryColorLight
                      ], begin: Alignment.topCenter),
                    ),
                    child: Icon(
                      Icons.more_vert_outlined,
                      color: Colors.grey.shade500,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(
                        "Jan",
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.grey.shade500,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index == 12) {
                        return RadialAnimatedBars();
                      }
                      return AnimatedBar(
                        model: list[index],
                      );
                    },
                    itemCount: list.length + 1,
                    scrollDirection: Axis.horizontal),
              ),
              RadialBar()
            ],
          ),
        ),
      ),
    );
  }
}
