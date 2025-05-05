import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check/data/models/check/check_pesponse.dart';
import 'package:lawyer_app/presentation/check/presentation/bloc/check_bloc.dart';
import 'package:lawyer_app/presentation/check/presentation/widgets/check_view_body.dart';
import 'package:lawyer_app/untility/app_color.dart' show AppColors;

class CheckView extends StatelessWidget {
  final CheckResponse;
  const CheckView({super.key, this.CheckResponse});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: CheckViewBody(),
    );
  }
}
