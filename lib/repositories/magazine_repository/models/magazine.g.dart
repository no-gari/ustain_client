// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magazine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Magazine _$MagazineFromJson(Map<String, dynamic> json) {
  return Magazine(
    json['id'] as int?,
    json['title'] as String?,
    json['bannerImage'] as String?,
    (json['category'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$MagazineCategoryEnumMap, e))
        .toList(),
    json['isLike'] as bool?,
    json['content'] as String?,
  );
}

Map<String, dynamic> _$MagazineToJson(Magazine instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isLike': instance.isLike,
      'category':
          instance.category?.map((e) => _$MagazineCategoryEnumMap[e]).toList(),
      'bannerImage': instance.bannerImage,
      'content': instance.content,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$MagazineCategoryEnumMap = {
  MagazineCategory.all: 'all',
  MagazineCategory.vegetarian: 'vegetarian',
  MagazineCategory.animals: 'animals',
  MagazineCategory.ecosystem: 'ecosystem',
  MagazineCategory.people: 'people',
};
