import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_test_1/data/remote/dio/dio_factory.dart';
import 'package:flutter_test_1/app/utils/constants.dart';
import 'package:flutter_test_1/data/remote/service/character_service.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(DioFactory(baseUrl).create());

  // Data - Remote
  injector.registerSingleton<CharacterService>(CharacterService(injector()));

}
