import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/help/presentation/bloc/help_bloc.dart';

import 'package:lawyer_app/untility/app_color.dart';

class CommonQuestion extends StatefulWidget {
  const CommonQuestion({Key? key}) : super(key: key);

  @override
  State<CommonQuestion> createState() => _CommonQuestionState();
}

class _CommonQuestionState extends State<CommonQuestion> {
  @override
  void initState() {
    super.initState();
    // Trigger fetch when the widget is inserted into the tree
    context.read<HelpBloc>().add(FetchFrequentlyQuestionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
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
          if (state is HelpLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HelpErrorState) {
            return Center(
              child: Text(
                'Error: ${state.helperResponse.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (state is HelpLoadedState) {
            final faqs =
                state.helpResponse.data!
                    .map(
                      (item) => FAQItem(
                        question: item['question'] as String,
                        answer: item['answer'] as String,
                      ),
                    )
                    .toList();

            final List<bool> isExpanded = List<bool>.filled(faqs.length, false);

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: faqs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return _FaqTile(
                  faq: faq,
                  initiallyExpanded: isExpanded[index],
                  onToggle: (expanded) {
                    setState(() {
                      isExpanded[index] = expanded;
                    });
                  },
                );
              },
            );
          }
          // initial empty or retry
          return const SizedBox();
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  FAQItem({required this.question, required this.answer});
}

class _FaqTile extends StatelessWidget {
  final FAQItem faq;
  final bool initiallyExpanded;
  final void Function(bool) onToggle;

  const _FaqTile({
    required this.faq,
    required this.initiallyExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setInnerState) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: ShapeDecoration(
            color: AppColors.lightPurple50,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: AppColors.lightPurple),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.question_mark, color: AppColors.lightPurple),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      faq.question,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final newVal = !initiallyExpanded;
                      setInnerState(() => onToggle(newVal));
                    },
                    icon: Icon(
                      initiallyExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.lightPurple,
                    ),
                  ),
                ],
              ),
              if (initiallyExpanded) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    faq.answer,
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
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lawyer_app/untility/app_color.dart';

// class FAQItem {
//   final String question;
//   final String answer;

//   FAQItem({required this.question, required this.answer});
// }

// class CommonQuestion extends StatefulWidget {
//   const CommonQuestion({super.key});

//   @override
//   State<CommonQuestion> createState() => _FAQViewState();
// }

// class _FAQViewState extends State<CommonQuestion> {
//   final List<FAQItem> faqItems = [
//     FAQItem(
//       question: "what is the first step in any criminal investigation?",
//       answer:
//           "Collaboration ensures information sharing, resource optimization, and quicker resolution of investigations.",
//     ),
//     FAQItem(
//       question: "why are witness interview crucial in an investigation?",
//       answer:
//           "Undercover operations help gather information or evidence on individuals involved in criminal activities by blending into their environment without raising suspicion.",
//     ),
//     FAQItem(
//       question: "why are witness interview crucial in an investigation?",
//       answer:
//           "Undercover operations help gather information or evidence on individuals involved in criminal activities by blending into their environment without raising suspicion.",
//     ),
//     FAQItem(
//       question: "why are witness interview crucial in an investigation?",
//       answer:
//           "Undercover operations help gather information or evidence on individuals involved in criminal activities by blending into their environment without raising suspicion.",
//     ),
//   ];

//   List<bool> isExpanded = [];

//   @override
//   void initState() {
//     super.initState();
//     isExpanded = List.filled(faqItems.length, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             GoRouter.of(context).pop();
//           },
//         ),
//         title: const Text(
//           'Common Question',
//           style: TextStyle(color: Colors.black, fontSize: 18),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16),
//         itemCount: faqItems.length,
//         separatorBuilder: (_, __) => const SizedBox(height: 12),
//         itemBuilder: (context, index) {
//           final item = faqItems[index];
//           return AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//             decoration: ShapeDecoration(
//               color: AppColors.lightPurple50,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(width: 1, color: AppColors.lightPurple),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     const Icon(
//                       CupertinoIcons.question_circle_fill,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         item.question,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Inter',
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isExpanded[index] = !isExpanded[index];
//                         });
//                       },
//                       icon: Icon(
//                         isExpanded[index]
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 if (isExpanded[index]) ...[
//                   const SizedBox(height: 12),
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: AppColors.lightGray,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       item.answer,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontFamily: 'Inter',
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
