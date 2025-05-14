import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/presentation/check/presentation/bloc/check_bloc.dart';
import 'package:lawyer_app/presentation/check/presentation/widgets/check_view_body.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/legal_check.page.model.dart';
import 'package:lawyer_app/untility/app_color.dart' show AppColors;

class CheckView extends StatelessWidget {
  final LegalCheck legalCheck;

  const CheckView({super.key, required this.legalCheck});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckBloc, CheckState>(
      listener: (context, state) {
        if (state is AcceptDoneState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('تم قبول الطلب بنجاح')));
          Navigator.of(context).pop(); // أو GoRouter.of(context).pop();
        } else if (state is RejectDoneState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('تم رفض الطلب بنجاح')));
          Navigator.of(context).pop(); // أو GoRouter.of(context).pop();
        } else if (state is CheckLoadingFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(' error: ${state.helperResponse.response}')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CheckViewBody(legalCheck: legalCheck),
      ),
    );
  }
}
