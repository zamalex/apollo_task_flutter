import 'package:apollo_task_flutter/presentation/widgets/details/tabs_widget.dart';
import 'package:flutter/material.dart';

import 'details_button.dart';
class BottomDetailsWidget extends StatelessWidget {
  const BottomDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const DetailsButtonWidget(),
          const SizedBox(width: 10),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 1.25,
            child: const SingleTab(isSelected: true, text: 'text'),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
