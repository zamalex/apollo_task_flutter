import 'package:apollo_task_flutter/data/model/list_response.dart';

import 'item_model.dart';

abstract class RepoInterface{
  Future<ListResponse?> getItems();
}