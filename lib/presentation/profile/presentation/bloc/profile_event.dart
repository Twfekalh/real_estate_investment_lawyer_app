part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class GetUserProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
