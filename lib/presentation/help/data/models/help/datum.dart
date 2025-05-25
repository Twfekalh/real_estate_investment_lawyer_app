import 'package:equatable/equatable.dart';

class Help extends Equatable {
  final int? id;
  final String? question;
  final String? answer;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Help({
    this.id,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
  });

  factory Help.fromJson(Map<String, dynamic> json) => Help(
    id: json['id'] as int?,
    question: json['question'] as String?,
    answer: json['Answer'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'Answer': answer,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props => [id, question, answer, createdAt, updatedAt];
}
