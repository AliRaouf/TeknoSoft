import 'package:equatable/equatable.dart';

class Nutrient extends Equatable {
  final String? name;
  final double? amount;
  final String? unit;
  final double? percentOfDailyNeeds;

  const Nutrient({
    this.name,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        name: json['name'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
        unit: json['unit'] as String?,
        percentOfDailyNeeds: (json['percentOfDailyNeeds'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'unit': unit,
        'percentOfDailyNeeds': percentOfDailyNeeds,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, amount, unit, percentOfDailyNeeds];
}
