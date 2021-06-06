import 'package:banking_app_ui/colors/colors.dart';
import 'package:banking_app_ui/widgets/curves.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final CardItemModel item;
  const CardItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${item.amount.toString()}",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade300,
                    fontSize: 30),
              ),
              MyCurves(),
              Text(
                "${item.percentage}%",
                style: TextStyle(
                    color: AppColor.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardItemModel {
  final String title;
  final int amount;
  final int percentage;

  const CardItemModel(this.title, this.amount, this.percentage);
}
