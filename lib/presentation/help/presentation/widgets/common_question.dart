import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/help/data/models/help/datum.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/presentation/help/presentation/bloc/help_bloc.dart';
import 'package:lawyer_app/presentation/help/data/models/help/help.dart';

class CommonQuestion extends StatefulWidget {
  const CommonQuestion({super.key});

  @override
  State<CommonQuestion> createState() => _FAQViewState();
}

class _FAQViewState extends State<CommonQuestion> {
  @override
  void initState() {
    super.initState();
    // نرسل الحدث عند بداية الـ widget
    context.read<HelpBloc>().add(FetchFrequentlyQuestionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Common Questions',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<HelpBloc, HelpState>(
        builder: (context, state) {
          // حالة التحميل
          if (state is HelpLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          // حالة الخطأ
          if (state is HelpErrorState) {
            return Center(
              child: Text(
                " An error occurred: ${state.helperResponse.response}",
              ),
            );
          }
          // حالة النجاح
          if (state is HelpLoadedState) {
            final List<Help> faqItems = state.helpResponse.data ?? [];

            // لو ما في عناصر
            if (faqItems.isEmpty) {
              return const Center(child: Text('لا توجد أسئلة شائعة'));
            }

            // مصفوفة حالات التوسيع
            final isExpanded = List<bool>.filled(faqItems.length, false);

            return StatefulBuilder(
              builder: (context, setLocalState) {
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: faqItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = faqItems[index];
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: ShapeDecoration(
                        color: AppColors.lightPurple50,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: AppColors.lightPurple,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.question_circle_fill,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item.question ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setLocalState(() {
                                    isExpanded[index] = !isExpanded[index];
                                  });
                                },
                                icon: Icon(
                                  isExpanded[index]
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          if (isExpanded[index]) ...[
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.lightGray,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                item.answer ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }
          // الحالة الافتراضية
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
