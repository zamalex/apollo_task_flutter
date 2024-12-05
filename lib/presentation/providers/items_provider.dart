import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/data/network/network.dart';
import 'package:apollo_task_flutter/domain/items_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../data/service_locator.dart';

class ItemsProvider extends ChangeNotifier {

   List<Item> _items=[];

   List<Item> get  items =>_items;


   getItems()async{

    ListResponse? list =await  sl<ItemsUseCase>().getItems();

    if(list!=null){
      _items = list.data!.items!;

      notifyListeners();
    }

   }



}