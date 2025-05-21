import 'package:equatable/equatable.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/complate/complate.dart';

abstract class ComplateState extends Equatable {
  const ComplateState();

  @override
  List<Object?> get props => [];
}

class ComplateInitial extends ComplateState {}

class ComplateLoadingState extends ComplateState {}

/// عند النجاح: تحوي الـ response
class ComplateLoadedState extends ComplateState {
  final ComplateResponse complateResponse;

  const ComplateLoadedState({required this.complateResponse});

  @override
  List<Object?> get props => [complateResponse];
}

/// عند الخطأ: تحوي helperResponse
class ComplateErrorState extends ComplateState {
  final HelperResponse helperResponse;

  const ComplateErrorState({required this.helperResponse});

  @override
  List<Object?> get props => [helperResponse];
}
