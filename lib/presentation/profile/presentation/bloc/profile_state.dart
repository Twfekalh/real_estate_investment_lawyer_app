part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileInLoadingState extends ProfileState {}

final class ProfileLoadingFailure extends ProfileState {
  final HelperResponse helperResponse;

  ProfileLoadingFailure({required this.helperResponse});
}

final class ProfileDoneState extends ProfileState {
  final ProfileResponse profileResponse;

  ProfileDoneState({required this.profileResponse});
}
