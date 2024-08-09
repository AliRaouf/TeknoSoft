import 'package:equatable/equatable.dart';

import 'step.dart';

class AnalyzedInstruction extends Equatable {
  final String? name;
  final List<Step>? steps;

  const AnalyzedInstruction({this.name, this.steps});

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) {
    return AnalyzedInstruction(
      name: json['name'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'steps': steps?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, steps];
}
