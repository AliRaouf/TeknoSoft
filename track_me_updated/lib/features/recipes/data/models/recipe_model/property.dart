import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final String? name;
  final double? amount;
  final String? unit;

  const Property({this.name, this.amount, this.unit});

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        name: json['name'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'unit': unit,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, amount, unit];
}
