import 'package:flutter/material.dart';

import '../../theme.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6,),
      decoration: BoxDecoration(
          color: AppTheme.kGreyColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Icon(Icons.access_time_filled_outlined,color: Colors.black,),
          SizedBox(width: 4,),
          Text('30 mins')
        ],
      ),
    );
  }
}
