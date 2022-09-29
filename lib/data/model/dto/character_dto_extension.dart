import 'package:flutter_test_1/data/model/characher/CharacterInfo.dart';
import 'package:flutter_test_1/data/model/characher/Location.dart';
import 'package:flutter_test_1/data/model/characher/Origin.dart';

import 'character_dto.dart';
import 'character_location_dto.dart';

extension CharacterInfoExtension on CharacterInfo {
  CharacterDto toCharacterDto() {
    return CharacterDto(
        id,
        name,
        status,
        species,
        type,
        gender,
        origin?.toLocationDto(),
        location?.toLocationDto(),
        image,
        episode,
        url,
        created);
  }
}

extension CharacterInfoListExtension on List<CharacterInfo>? {
  List<CharacterDto> toCharacterDtoList() {
    if (this != null || this!.isNotEmpty) {
      return this!.map((e) => e.toCharacterDto()).toList();
    }
    return List.empty();
  }
}

extension OriginExtension on Origin {
  CharacterLocationDto toLocationDto() {
    return CharacterLocationDto(url.toString().getIdFromUrl(), name, url);
  }
}

extension LocationExtension on Location {
  CharacterLocationDto toLocationDto() {
    return CharacterLocationDto(url.toString().getIdFromUrl(), name, url);
  }
}

extension StringExtension on String {
  int getIdFromUrl() {
    if (isNotEmpty) {
      return int.parse(substring(lastIndexOf("/") + 1));
    } else {
      return 0;
    }
  }
}
