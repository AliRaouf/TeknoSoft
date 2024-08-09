import 'package:equatable/equatable.dart';

class WeightPerServing extends Equatable {
  final int? amount;
  final String? unit;

  const WeightPerServing({this.amount, this.unit});

  factory WeightPerServing.fromJson(Map<String, dynamic> json) {
    return WeightPerServing(
      amount: json['amount'] as int?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'unit': unit,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [amount, unit];
}
