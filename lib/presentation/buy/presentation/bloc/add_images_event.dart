import 'package:equatable/equatable.dart';

abstract class AddImagesEvent extends Equatable {
  const AddImagesEvent();

  @override
  List<Object?> get props => [];
}

/// الحدث لإرسال الصور
class SubmitAddImagesEvent extends AddImagesEvent {
  final int id;
  final String frontImagePath;
  final String backImagePath;

  const SubmitAddImagesEvent({
    required this.id,
    required this.frontImagePath,
    required this.backImagePath,
  });

  @override
  List<Object?> get props => [id, frontImagePath, backImagePath];
}
