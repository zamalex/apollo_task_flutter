




import 'package:apollo_task_flutter/data/network/network.dart';
import 'package:apollo_task_flutter/data/repository/repo_implementation.dart';
import 'package:apollo_task_flutter/domain/items_use_case.dart';
import 'package:get_it/get_it.dart';

import '../domain/repo_interface.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Http
  sl.registerLazySingleton<Network>(() => Network());
  sl.registerLazySingleton<RepoInterface>(() => RepoImpl(sl()));
  sl.registerLazySingleton<ItemsUseCase>(() => ItemsUseCase(sl()));




}
