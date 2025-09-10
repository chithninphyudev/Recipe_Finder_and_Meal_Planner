import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'step.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Step {
  @HiveField(0)
  final int number;

  @HiveField(1)
  final String step;

  Step({
    required this.number,
    required this.step,
  });

  factory Step.fromJson(Map<String, dynamic> json) =>
      _$StepFromJson(json);

  Map<String, dynamic> toJson() => _$StepToJson(this);
}
