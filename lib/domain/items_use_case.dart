import 'package:apollo_task_flutter/data/model/list_response.dart';

import 'item_model.dart';
import 'repo_interface.dart';

class ItemsUseCase{
  RepoInterface _repoInterface;

  ItemsUseCase(this._repoInterface);


  Future<ListResponse?> getItems(){
    return _repoInterface.getItems();
  }
}