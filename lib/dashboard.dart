import 'package:banking_app_ui/widgets/appbar.dart';
import 'package:banking_app_ui/widgets/card.dart';
import 'package:flutter/material.dart';

import 'widgets/cardItem.dart';

class Dashboard extends StatelessWidget {
  final list = [
    CardItemModel("Total Income", 1200, 45),
    CardItemModel("Total Expense", 450, 53),
    CardItemModel("Total Income", 6100, 75),
    CardItemModel("Total Income", 1200, 45),
    CardItemModel("Total Income", 1200, 45),
  ];
  Dashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(),
        SizedBox(
          height: 40,
        ),
        DetailCard(),
        SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return CardItem(item: list[index]);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
