import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'step.dart';

part 'instruction.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class Instruction {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<Step> steps;

  Instruction({
    required this.name,
    required this.steps,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) =>
      _$InstructionFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}
