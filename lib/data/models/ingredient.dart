import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Ingredient {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final String unit;

  @HiveField(4)
  final String original;

  @HiveField(5)
  final String image;

  Ingredient({
    required this.id,
    required this.name,
    required this.amount,
    required this.unit,
    required this.original,
    required this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
