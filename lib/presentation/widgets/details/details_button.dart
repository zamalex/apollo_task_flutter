import 'package:flutter/material.dart';

import '../../theme.dart';

class DetailsButtonWidget extends StatelessWidget {
  const DetailsButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.yellow),
      width: MediaQuery.of(context).size.width / 1.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.kPrimaryColor,
            child: Text(
              '5',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ),
          SizedBox(width: 15),
          Text(
            'Add ingredients to cart',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppTheme.kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
