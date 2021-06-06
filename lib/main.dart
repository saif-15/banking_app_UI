import 'package:banking_app_ui/colors/colors.dart';
import 'package:banking_app_ui/widgets/appbar.dart';
import 'package:banking_app_ui/widgets/bottombar.dart';
import 'package:banking_app_ui/widgets/card.dart';
import 'package:banking_app_ui/widgets/cardItem.dart';
import 'package:banking_app_ui/widgets/vertical_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData(
          accentColor: AppColor.orange,
          textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Dashboard(),
        bottomNavigationBar: BottomBar(items: [
          BottomBarItem(icon: Icons.person, title: "profile"),
          BottomBarItem(icon: Icons.search, title: "search"),
          BottomBarItem(icon: Icons.home_filled, title: "home"),
          BottomBarItem(icon: Icons.add_alert, title: "notification"),
          BottomBarItem(icon: Icons.settings, title: "settings"),
          //   BottomBarItem(icon: Icons.add_alert, title: "notification")
        ], onTap: (index) {}),
      ),
    );
  }
}
