import 'package:lawyer_app/config/api_config.dart';
import 'package:lawyer_app/core/api_service.dart';
import 'package:lawyer_app/core/constant.dart';
import 'package:lawyer_app/core/enums.dart';
import 'package:lawyer_app/presentation/profile/data/models/profile/profile.model.dart';
import 'package:lawyer_app/presentation/profile/data/repo/profile_repo.dart';
import 'package:lawyer_app/presentation/profile/presentation/bloc/profile_bloc.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService _apiService;

  ProfileRepoImpl(this._apiService);

  @override
  Future getUserProfile(GetUserProfileEvent event) async {
    final helperResponse = await _apiService.get(
      endpoint: ApiConfig.getProfile,
      token: token,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final profileResponse = ProfileResponse.fromJson(
          helperResponse.fullBody!,
        );

        print('Full response: ${helperResponse.fullBody}');
        print(profileResponse.message);

        return profileResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
}
