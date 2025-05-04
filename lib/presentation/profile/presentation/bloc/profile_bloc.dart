import 'package:bloc/bloc.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/presentation/profile/data/models/profile/profile.model.dart';
import 'package:lawyer_app/presentation/profile/data/repo/profile_repo_impl.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepoImpl profileRepoImpl;

  ProfileBloc(this.profileRepoImpl) : super(ProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(ProfileInLoadingState());

      final response = await profileRepoImpl.getUserProfile(event);

      if (response is ProfileResponse) {
        emit(ProfileDoneState(profileResponse: response));
      } else {
        emit(ProfileLoadingFailure(helperResponse: response));
      }
    });
  }
}
