import 'package:apollo_task_flutter/data/model/details_response.dart';
import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/data/network/network.dart';
import 'package:apollo_task_flutter/domain/items_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../data/service_locator.dart';

class ItemsProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;  // Add an error state to notify the UI
  String errorMessage = '';  // Store error message

  List<Recipe> _recipes = [];
  List<ListProduct> _ingredients = [];
  List<Step> _steps = [];

  List<Recipe> get items => _recipes;
  List<ListProduct> get ingredients => _ingredients;
  List<Step> get steps => _steps;

  getItems() async {
    isLoading = true;
    notifyListeners();

    var result = await sl<ItemsUseCase>().getItems();

    result.isRight ? _handleSuccessItems(result.right!) : _handleError(result.left!);

    isLoading = false;
    notifyListeners();
  }

  getDetails() async {
    isLoading = true;
    notifyListeners();

    var result = await sl<ItemsUseCase>().getDetails();

    result.isRight ? _handleSuccessDetails(result.right!) : _handleError(result.left!);

    isLoading = false;
    notifyListeners();
  }

  void _handleSuccessItems(ListResponse listResponse) {
    if (listResponse.error == null) {
      _recipes = listResponse.data!.recipes!;
      hasError = false;
      errorMessage = '';
    } else {
      _handleError(listResponse.error!);
    }
  }

  void _handleSuccessDetails(DetailsResponse detailsResponse) {
    _ingredients = detailsResponse.data?.listProducts ?? [];
    _steps = detailsResponse.data?.steps ?? [];
    hasError = false;
    errorMessage = '';
  }

  void _handleError(String error) {
    hasError = true;


    print('errrror ${error}');
  }
}
