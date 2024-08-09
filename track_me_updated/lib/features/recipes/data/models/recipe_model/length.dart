import 'package:equatable/equatable.dart';

class Length extends Equatable {
  final int? number;
  final String? unit;

  const Length({this.number, this.unit});

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json['number'] as int?,
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'unit': unit,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [number, unit];
}
