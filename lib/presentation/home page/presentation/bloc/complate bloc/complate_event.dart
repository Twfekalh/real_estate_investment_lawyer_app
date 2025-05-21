import 'package:equatable/equatable.dart';

abstract class ComplateEvent extends Equatable {
  const ComplateEvent();

  @override
  List<Object?> get props => [];
}

class FetchComplateEvent extends ComplateEvent {}
