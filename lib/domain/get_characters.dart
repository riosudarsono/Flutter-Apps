import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test_1/core/use_case.dart';
import 'package:flutter_test_1/data/model/dto//character_dto.dart';
import 'package:flutter_test_1/data/model/dto/character_dto_extension.dart';
import 'package:flutter_test_1/data/remote/dio/data_state.dart';
import 'package:flutter_test_1/data/remote/dio/dio_exception.dart';
import 'package:flutter_test_1/data/repository/character_repository.dart';

class GetCharacters
    implements UseCase<DataState<List<CharacterDto>>, GetCharactersParams> {
  final CharacterRepository _characterRepository;

  GetCharacters(this._characterRepository);

  @override
  Future<DataState<List<CharacterDto>>> call(
      {required GetCharactersParams params}) async {
    try {
      final httpResponse = await _characterRepository.getCharacters(
        params.page,
        params.options,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results.toCharacterDtoList());
      }
      return DataFailed(httpResponse.response.statusMessage);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DataFailed(errorMessage);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e.toString());
    }
  }
}

class GetCharactersParams {
  final int page;
  final Map<String, String>? options;

  GetCharactersParams(this.page, this.options);
}