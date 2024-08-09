import 'package:equatable/equatable.dart';

import 'equipment.dart';
import 'ingredient.dart';
import 'length.dart';

class Step extends Equatable {
  final int? number;
  final String? step;
  final List<Ingredient>? ingredients;
  final List<Equipment>? equipment;
  final Length? length;

  const Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json['number'] as int?,
        step: json['step'] as String?,
        ingredients: (json['ingredients'] as List<dynamic>?)
            ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
            .toList(),
        equipment: (json['equipment'] as List<dynamic>?)
            ?.map((e) => Equipment.fromJson(e as Map<String, dynamic>))
            .toList(),
        length: json['length'] == null
            ? null
            : Length.fromJson(json['length'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'step': step,
        'ingredients': ingredients?.map((e) => e.toJson()).toList(),
        'equipment': equipment?.map((e) => e.toJson()).toList(),
        'length': length?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      number,
      step,
      ingredients,
      equipment,
      length,
    ];
  }
}
