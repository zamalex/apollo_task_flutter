import 'package:apollo_task_flutter/data/model/details_response.dart';
import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/data/network/network.dart';
import 'package:apollo_task_flutter/domain/items_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../data/service_locator.dart';

class ItemsProvider extends ChangeNotifier {

  bool isLoading = false;
   List<Item> _items=[];

   List<ListProduct> _ingredients=[];
   List<Step> _steps=[];

   List<Item> get  items =>_items;
   List<ListProduct> get  ingredients =>_ingredients;
   List<Step> get  steps =>_steps;


   getItems()async{
     isLoading = true;

     notifyListeners();

    ListResponse? list =await  sl<ItemsUseCase>().getItems();

    if(list!=null){
      _items = list.data!.items!;

    }
     isLoading = false;

     notifyListeners();

   }


   getDetails()async{

     isLoading = true;

     notifyListeners();
    DetailsResponse? response =await  sl<ItemsUseCase>().getDetails();

    if(response!=null){
      _ingredients = response.data!.listProducts??[];
      _steps = response.data!.steps??[];


    }

    isLoading = false;
     notifyListeners();

   }



}