import 'package:apollo_task_flutter/data/network/network.dart';
import 'package:apollo_task_flutter/domain/item_model.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repo_interface.dart';
import '../model/list_response.dart';

class RepoImpl extends RepoInterface{
  Network _network;

  RepoImpl(this._network);

  @override
  Future<ListResponse?> getItems()async {
    try {
      final response = await _network.get(Network.ITEMS_URL);

      ListResponse listResponse = ListResponse.fromJson(response.data);

      debugPrint('response ${listResponse.success}');
      return listResponse;

    } catch (e) {

    return null;
    }

  }

}