import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check/widgets/check_view_body.dart';
import 'package:lawyer_app/untility/app_color.dart' show AppColors;

class CheckView extends StatelessWidget {
  const CheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: CheckViewBody(),
    );
  }
}
