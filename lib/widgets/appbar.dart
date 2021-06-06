import 'package:banking_app_ui/colors/colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColorDark,
                          AppColor.primaryColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Icon(
                  Icons.menu,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColor.orange,
            )
          ],
        ),
      ),
    );
  }
}
