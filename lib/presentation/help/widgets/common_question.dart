import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/untility/app_color.dart';

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class CommonQuestion extends StatefulWidget {
  const CommonQuestion({super.key});

  @override
  State<CommonQuestion> createState() => _FAQViewState();
}

class _FAQViewState extends State<CommonQuestion> {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: "what is the first step in any criminal investigation?",
      answer:
          "Collaboration ensures information sharing, resource optimization, and quicker resolution of investigations.",
    ),
    FAQItem(
      question: "why are witness interview crucial in an investigation?",
      answer:
          "Undercover operations help gather information or evidence on individuals involved in criminal activities by blending into their environment without raising suspicion.",
    ),
    FAQItem(
      question: "why are witness interview crucial in an investigation?",
      answer:
          "Undercover operations help gather information or evidence on individuals involved in criminal activities by blending into their environment without raising suspicion.",
    ),
    FAQItem(
      question: "why are witness interview crucial in an investigation?",
      answer:
          "Undercover operations help gather information or evidence on individuals involved in criminal activities by blending into their environment without raising suspicion.",
    ),
  ];

  List<bool> isExpanded = [];

  @override
  void initState() {
    super.initState();
    isExpanded = List.filled(faqItems.length, false);
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
          'Common Question',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: faqItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = faqItems[index];
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
                    const Icon(
                      CupertinoIcons.question_circle_fill,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.question,
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
                        setState(() {
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
                      item.answer,
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
      ),
    );
  }
}
