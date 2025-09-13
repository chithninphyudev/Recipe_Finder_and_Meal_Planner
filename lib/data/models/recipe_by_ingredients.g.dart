// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_by_ingredients.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeByIngredientsAdapter extends TypeAdapter<RecipeByIngredients> {
  @override
  final int typeId = 5;

  @override
  RecipeByIngredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeByIngredients(
      id: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as String,
      imageType: fields[3] as String,
      usedIngredientCount: fields[4] as int,
      missedIngredientCount: fields[5] as int,
      missedIngredients: (fields[6] as List).cast<Ingredient>(),
      usedIngredients: (fields[7] as List).cast<Ingredient>(),
      unusedIngredients: (fields[8] as List).cast<Ingredient>(),
      likes: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeByIngredients obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.imageType)
      ..writeByte(4)
      ..write(obj.usedIngredientCount)
      ..writeByte(5)
      ..write(obj.missedIngredientCount)
      ..writeByte(6)
      ..write(obj.missedIngredients)
      ..writeByte(7)
      ..write(obj.usedIngredients)
      ..writeByte(8)
      ..write(obj.unusedIngredients)
      ..writeByte(9)
      ..write(obj.likes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeByIngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeByIngredients _$RecipeByIngredientsFromJson(Map<String, dynamic> json) =>
    RecipeByIngredients(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      imageType: json['imageType'] as String,
      usedIngredientCount: (json['usedIngredientCount'] as num).toInt(),
      missedIngredientCount: (json['missedIngredientCount'] as num).toInt(),
      missedIngredients: (json['missedIngredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      usedIngredients: (json['usedIngredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      unusedIngredients: (json['unusedIngredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: (json['likes'] as num).toInt(),
    );

Map<String, dynamic> _$RecipeByIngredientsToJson(
        RecipeByIngredients instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'imageType': instance.imageType,
      'usedIngredientCount': instance.usedIngredientCount,
      'missedIngredientCount': instance.missedIngredientCount,
      'missedIngredients': instance.missedIngredients,
      'usedIngredients': instance.usedIngredients,
      'unusedIngredients': instance.unusedIngredients,
      'likes': instance.likes,
    };
