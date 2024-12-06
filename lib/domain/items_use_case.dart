// items_use_case.dart
import 'package:apollo_task_flutter/data/model/details_response.dart';
import 'package:apollo_task_flutter/data/model/list_response.dart';

import '../data/network/either.dart';
import 'repo_interface.dart';

class ItemsUseCase {
  final RepoInterface _repoInterface;

  ItemsUseCase(this._repoInterface);

  Future<Either<String, ListResponse>> getItems() {
    return _repoInterface.getItems();
  }

  Future<Either<String, DetailsResponse>> getDetails() {
    return _repoInterface.getDetails();
  }
}
