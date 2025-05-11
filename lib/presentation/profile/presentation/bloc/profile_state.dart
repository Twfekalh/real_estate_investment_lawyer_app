part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileInLoadingState extends ProfileState {}

class ProfileLoadingFailure extends ProfileState {
  final HelperResponse helperResponse;

  ProfileLoadingFailure({required this.helperResponse});

  @override
  List<Object?> get props => [helperResponse];
}

class ProfileDoneState extends ProfileState {
  final ProfileResponse profileResponse;

  ProfileDoneState({required this.profileResponse});

  @override
  List<Object?> get props => [profileResponse];
}

// part of 'profile_bloc.dart';

// @immutable
// sealed class ProfileState {}

// final class ProfileInitial extends ProfileState {}

// final class ProfileInLoadingState extends ProfileState {}

// final class ProfileLoadingFailure extends ProfileState {
//   final HelperResponse helperResponse;

//   ProfileLoadingFailure({required this.helperResponse});
// }

// final class ProfileDoneState extends ProfileState {
//   final ProfileResponse profileResponse;

//   ProfileDoneState({required this.profileResponse});
// }
