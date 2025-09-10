// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      id: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as String,
      readyInMinutes: fields[3] as int,
      servings: fields[4] as int,
      sourceUrl: fields[5] as String,
      vegetarian: fields[6] as bool,
      vegan: fields[7] as bool,
      glutenFree: fields[8] as bool,
      dairyFree: fields[9] as bool,
      healthScore: fields[10] as double,
      summary: fields[11] as String,
      extendedIngredients: (fields[12] as List).cast<Ingredient>(),
      analyzedInstructions: (fields[13] as List).cast<Instruction>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.readyInMinutes)
      ..writeByte(4)
      ..write(obj.servings)
      ..writeByte(5)
      ..write(obj.sourceUrl)
      ..writeByte(6)
      ..write(obj.vegetarian)
      ..writeByte(7)
      ..write(obj.vegan)
      ..writeByte(8)
      ..write(obj.glutenFree)
      ..writeByte(9)
      ..write(obj.dairyFree)
      ..writeByte(10)
      ..write(obj.healthScore)
      ..writeByte(11)
      ..write(obj.summary)
      ..writeByte(12)
      ..write(obj.extendedIngredients)
      ..writeByte(13)
      ..write(obj.analyzedInstructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: (json['readyInMinutes'] as num).toInt(),
      servings: (json['servings'] as num).toInt(),
      sourceUrl: json['sourceUrl'] as String,
      vegetarian: json['vegetarian'] as bool,
      vegan: json['vegan'] as bool,
      glutenFree: json['glutenFree'] as bool,
      dairyFree: json['dairyFree'] as bool,
      healthScore: (json['healthScore'] as num).toDouble(),
      summary: json['summary'] as String,
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>)
          .map((e) => Instruction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'sourceUrl': instance.sourceUrl,
      'vegetarian': instance.vegetarian,
      'vegan': instance.vegan,
      'glutenFree': instance.glutenFree,
      'dairyFree': instance.dairyFree,
      'healthScore': instance.healthScore,
      'summary': instance.summary,
      'extendedIngredients':
          instance.extendedIngredients.map((e) => e.toJson()).toList(),
      'analyzedInstructions':
          instance.analyzedInstructions.map((e) => e.toJson()).toList(),
    };
