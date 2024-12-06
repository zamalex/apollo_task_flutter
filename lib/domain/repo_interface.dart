import 'package:apollo_task_flutter/data/model/details_response.dart';
import 'package:apollo_task_flutter/data/model/list_response.dart';

import '../data/network/either.dart';

abstract class RepoInterface {
  Future<Either<String, ListResponse>> getItems();
  Future<Either<String, DetailsResponse>> getDetails();
}