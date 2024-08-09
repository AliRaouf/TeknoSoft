import 'package:equatable/equatable.dart';

class Equipment extends Equatable {
  final int? id;
  final String? name;
  final String? localizedName;
  final String? image;

  const Equipment({this.id, this.name, this.localizedName, this.image});

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
        id: json['id'] as int?,
        name: json['name'] as String?,
        localizedName: json['localizedName'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'localizedName': localizedName,
        'image': image,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, localizedName, image];
}
