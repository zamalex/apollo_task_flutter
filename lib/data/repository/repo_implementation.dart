import 'package:apollo_task_flutter/data/model/details_response.dart';
import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/data/network/network.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repo_interface.dart';
import '../network/either.dart';
import '../network/urls.dart';

class RepoImpl extends RepoInterface {
  final Network _network;

  RepoImpl(this._network);

  @override
  Future<Either<String, ListResponse>> getItems() async {
    try {
      final response = await _network.get(URLs.ITEMS_URL);
      ListResponse listResponse = ListResponse.fromJson(response.data);
      return Either.right(listResponse);  // Return successful response
    } catch (e) {
      return Either.left("Error: ${e.toString()}");  // Return error message
    }
  }

  @override
  Future<Either<String, DetailsResponse>> getDetails() async {
    try {
      final response = await _network.get(URLs.DETAILS_URL);
      DetailsResponse detailsResponse = DetailsResponse.fromJson(response.data);
      debugPrint('details response ${detailsResponse.success}');
      return Either.right(detailsResponse);  // Return successful response
    } catch (e) {
      print(e.toString());
      return Either.left("Error: ${e.toString()}");  // Return error message
    }
  }
}
