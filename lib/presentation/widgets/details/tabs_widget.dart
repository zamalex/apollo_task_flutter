import 'package:flutter/material.dart';

import '../../theme.dart';

class TabsWidget extends StatefulWidget {
   TabsWidget({
    super.key,
    required this.onSelect,
    this.selectedIndex=0
  });

  final Function onSelect;
   int selectedIndex;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
              onTap: (){
                setState(() {
                  widget.selectedIndex=0;
                  widget.onSelect(0);
                });
              },
              child: SingleTab(text: 'Ingredients', isSelected: widget.selectedIndex==0,)),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: InkWell

            (
              onTap: (){
                setState(() {
                  widget.selectedIndex=1;
                  widget.onSelect(1);

                });
              },
              child: SingleTab(text: 'Ingredients', isSelected: widget.selectedIndex==1,)),
        ),


      ],
    );
  }
}

class SingleTab extends StatelessWidget {
  const SingleTab({
    super.key,
    required this.isSelected,
    required this.text
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(color:isSelected?Colors.yellow:Colors.black),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected?AppTheme.kPrimaryColor:Colors.black),
          color: isSelected?AppTheme.kPrimaryColor:Colors.white,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
