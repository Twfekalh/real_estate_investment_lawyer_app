import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final int? id;
  final String? state;
  final String? exactPosition;

  const Property({this.id, this.state, this.exactPosition});

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json['id'] as int?,
    state: json['state'] as String?,
    exactPosition: json['exact_position'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'state': state,
    'exact_position': exactPosition,
  };

  @override
  List<Object?> get props => [id, state, exactPosition];
}
