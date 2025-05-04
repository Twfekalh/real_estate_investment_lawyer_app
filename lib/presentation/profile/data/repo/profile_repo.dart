import 'package:lawyer_app/presentation/profile/presentation/bloc/profile_bloc.dart';

abstract class ProfileRepo {
  Future getUserProfile(GetUserProfileEvent event);
}
