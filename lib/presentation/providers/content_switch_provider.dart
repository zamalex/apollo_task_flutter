import 'package:flutter/cupertino.dart';

class ContentSwitchProvider extends ChangeNotifier{


  int _selectedTab=0;

  int get selectedTab => _selectedTab;


  selectTab(int index){

    if(_selectedTab==index) {
      return;
    }
    _selectedTab = index;
   notifyListeners();

  }

}