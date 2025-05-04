import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/core/service_locator.dart';
import 'package:lawyer_app/presentation/profile/presentation/bloc/profile_bloc.dart';
import 'package:lawyer_app/presentation/profile/presentation/widget/profile_info_row.dart';
import 'package:lawyer_app/untility/app_assests.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/elevated_button_widget.dart';
import 'package:lawyer_app/untility/somthing_wrong.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc(getIt())..add(GetUserProfileEvent());
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInLoadingState || state is ProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileLoadingFailure) {
              return SomethingWrongWidget(
                title: "Failed to load profile",
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed:
                      //   _profileBloc.add(GetUserProfileEvent());
                      () => context.read<ProfileBloc>().add(
                        GetUserProfileEvent(),
                      ),

                  //                  child: const Text("Retry"),
                ),
              );
            }

            if (state is ProfileDoneState) {
              final user = state.profileResponse.data!;
              final initials = _getInitials(user.name);

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: Row(
                        children: [
                          Container(
                            width: 103,
                            height: 103,
                            decoration: ShapeDecoration(
                              color: const Color(0x669A8AEC),
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: 4,
                                  color: const Color(0xFF836DF3),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                initials,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 35),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Joined: ${_formatDate(user.createdAt)}',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.53),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 349,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: ShapeDecoration(
                        color: const Color(0x3F9A8AEC),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 3,
                            color: Color(0xFF836DF3),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          ProfileInfoRow(
                            icon: AppAssets.messageIcon,
                            text: user.email ?? '',
                            onTap: () {},
                            iconColor: Colors.black54,
                            iconSize: 35,
                          ),
                          const SizedBox(height: 10),
                          ProfileInfoRow(
                            icon: AppAssets.phoneIcon,
                            text: user.phone ?? '',
                            onTap: () {},
                            iconColor: Colors.black54,
                            iconSize: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox(); // Fallback
          },
        ),
      ),
    );
  }

  String _getInitials(String? name) {
    if (name == null || name.isEmpty) return "NA";
    final parts = name.trim().split(" ");
    if (parts.length == 1) return parts[0].substring(0, 1).toUpperCase();
    return parts[0][0].toUpperCase() + parts[1][0].toUpperCase();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day} ${_monthName(date.month)} ${date.year}';
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }
}
