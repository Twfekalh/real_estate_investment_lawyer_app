import 'package:equatable/equatable.dart';

import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/buy/data/models/buy/add_images_response/add_images_response.dart';
import 'package:lawyer_app/presentation/buy/data/models/buy/buy.request.add.images.dart';

abstract class AddImagesState extends Equatable {
  const AddImagesState();

  @override
  List<Object?> get props => [];
}

class AddImagesInitial extends AddImagesState {}

class AddImagesLoadingState extends AddImagesState {}

class AddImagesSuccessState extends AddImagesState {
  final AddImagesResponse addImagesResponse;

  const AddImagesSuccessState({required this.addImagesResponse});

  @override
  List<Object?> get props => [addImagesResponse];
}

class AddImagesErrorState extends AddImagesState {
  final HelperResponse helperResponse;

  const AddImagesErrorState({required this.helperResponse});

  @override
  List<Object?> get props => [helperResponse];
}
