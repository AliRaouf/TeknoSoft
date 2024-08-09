import 'package:equatable/equatable.dart';

class CaloricBreakdown extends Equatable {
  final double? percentProtein;
  final double? percentFat;
  final double? percentCarbs;

  const CaloricBreakdown({
    this.percentProtein,
    this.percentFat,
    this.percentCarbs,
  });

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) {
    return CaloricBreakdown(
      percentProtein: (json['percentProtein'] as num?)?.toDouble(),
      percentFat: (json['percentFat'] as num?)?.toDouble(),
      percentCarbs: (json['percentCarbs'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'percentProtein': percentProtein,
        'percentFat': percentFat,
        'percentCarbs': percentCarbs,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [percentProtein, percentFat, percentCarbs];
}
