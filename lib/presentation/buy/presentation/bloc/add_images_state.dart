import 'package:equatable/equatable.dart';

import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/buy/data/models/buy/buy.request.add.images.dart';

abstract class AddImagesState extends Equatable {
  const AddImagesState();

  @override
  List<Object?> get props => [];
}

class AddImagesInitial extends AddImagesState {}

class AddImagesLoadingState extends AddImagesState {}

/// عند النجاح: يحتوي على الـ response
class AddImagesSuccessState extends AddImagesState {
  final AddImagesResponse addImagesResponse;

  const AddImagesSuccessState({required this.addImagesResponse});

  @override
  List<Object?> get props => [addImagesResponse];
}

/// عند الخطأ: يحتوي على helperResponse
class AddImagesErrorState extends AddImagesState {
  final HelperResponse helperResponse;

  const AddImagesErrorState({required this.helperResponse});

  @override
  List<Object?> get props => [helperResponse];
}
