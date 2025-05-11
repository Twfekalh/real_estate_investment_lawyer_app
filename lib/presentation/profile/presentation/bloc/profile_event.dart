part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// part of 'profile_bloc.dart';

// @immutable
// sealed class ProfileEvent {}

// class GetUserProfileEvent extends ProfileEvent {
//   @override
//   List<Object?> get props => [];
// }
