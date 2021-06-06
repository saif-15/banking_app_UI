import 'dart:ui';

import 'package:banking_app_ui/colors/colors.dart';
import 'package:banking_app_ui/detailpage.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.85;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: AppColor.primaryColorDark,
                      spreadRadius: 10)
                ],
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(colors: [
                  AppColor.primaryColorLight,
                  AppColor.primaryColorDark,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi Saif",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
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
                        color: Colors.grey.shade400,
                      ),
                    )
                  ],
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Balance",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 20),
                        ),
                        Text(
                          "\$92,510",
                          style: TextStyle(
                              color: Colors.grey.shade300, fontSize: 30),
                        ),
                      ],
                    ),
                    Container(
                        height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            AppColor.primaryColorDark,
                            AppColor.primaryColorLight
                          ], begin: Alignment.topCenter),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.south,
                              color: AppColor.orange,
                            ),
                            Text(
                              "5.9%",
                              style: TextStyle(
                                  color: AppColor.orange,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ],
                )
              ],
            )),
        GestureDetector(
          onHorizontalDragStart: (details) {
            Navigator.of(context).push(_buildPageRoute());
          },
          child: Container(
              width: 35,
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.orange,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Icon(Icons.arrow_forward_ios_outlined)),
        ),
      ],
    );
  }

  Route _buildPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DetailPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        return SlideTransition(
          position: tween,
          child: child,
        );
      },
    );
  }
}
