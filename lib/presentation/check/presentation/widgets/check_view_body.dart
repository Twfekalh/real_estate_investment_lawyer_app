import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check/presentation/bloc/check_bloc.dart';
import 'package:lawyer_app/presentation/check/presentation/widgets/refuse_reason_bottom_sheet.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/legal_check.page.model.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart' show AppRouter;
import 'pressable_button.dart';

class CheckViewBody extends StatelessWidget {
  final LegalCheck legalCheck;

  const CheckViewBody({super.key, required this.legalCheck});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckBloc, CheckState>(
      listener: (context, state) {
        if (state is AcceptDoneState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('تم قبول الطلب بنجاح')));
          SchedulerBinding.instance.addPostFrameCallback((_) {
            GoRouter.of(context).go(AppRouter.kHomePageView);
          });
        } else if (state is RejectDoneState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('تم رفض الطلب بنجاح')));
          SchedulerBinding.instance.addPostFrameCallback((_) {
            GoRouter.of(context).go(AppRouter.kHomePageView);
          });
        } else if (state is CheckLoadingFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطأ: ${state.helperResponse.response}')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => GoRouter.of(context).pop(),
            ),
            title: const Text('Check', style: TextStyle(color: Colors.black)),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.dangerous, color: AppColors.brightRed),
                onPressed: () async {
                  final reason = await showModalBottomSheet<String>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    builder:
                        (_) => const Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                            left: 16,
                            right: 16,
                            top: 12,
                          ),
                          child: RefuseReasonBottomSheet(),
                        ),
                  );
                  if (reason != null && reason.isNotEmpty) {
                    context.read<CheckBloc>().add(
                      RejectRequestEvent(legalCheck.id!, reason),
                    );
                  }
                },
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // بطاقة بيانات الطلب
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.lightPurple100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Request ID: ${legalCheck.id}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'User: ${legalCheck.userName}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Status: ${legalCheck.status}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Description: ${legalCheck.description}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Property Type: ${legalCheck.propertyType}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Location: ${legalCheck.location}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Created At: ${legalCheck.createdAt}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // زر Description Information
                    PressableButton(
                      text: 'Description Information',
                      initialColor: AppColors.lightPurple,
                      pressedColor: AppColors.lightPurple100,
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kCheckPropertyView,
                          extra: legalCheck.id,
                        );
                      },
                    ),
                    const SizedBox(height: 30),

                    // زر Check Documents
                    PressableButton(
                      text: 'Check Documents',
                      initialColor: AppColors.lightPurple,
                      pressedColor: AppColors.lightPurple100,
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kCheckDocumentView, extra: legalCheck);
                      },
                    ),

                    const Spacer(),

                    // زر Done (للقبول)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Center(
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<CheckBloc>().add(
                                AcceptRequestEvent(legalCheck.id!),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightPurple100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                  color: AppColors.lightPurple,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.lightPurple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // مؤشّر التحميل فوق المحتوى في حالة Loading
              if (state is CheckInLoadingState)
                Container(
                  color: Colors.black38,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }
}
