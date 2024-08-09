import 'package:equatable/equatable.dart';

import 'nutrient.dart';

class Ingredient extends Equatable {
  final int? id;
  final String? name;
  final double? amount;
  final String? unit;
  final List<Nutrient>? nutrients;

  const Ingredient({
    this.id,
    this.name,
    this.amount,
    this.unit,
    this.nutrients,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json['id'] as int?,
        name: json['name'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
        unit: json['unit'] as String?,
        nutrients: (json['nutrients'] as List<dynamic>?)
            ?.map((e) => Nutrient.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'amount': amount,
        'unit': unit,
        'nutrients': nutrients?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, amount, unit, nutrients];
}
