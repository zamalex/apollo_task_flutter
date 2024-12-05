import 'package:flutter/material.dart';

import '../../theme.dart';

class Spotlight extends StatelessWidget {
  const Spotlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6,),
      decoration: BoxDecoration(
        color: AppTheme.kGreenColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Icon(Icons.crisis_alert,color: Colors.black,),
          SizedBox(width: 4,),

          Text('Spotlight')
        ],
      ),
    );
  }
}
