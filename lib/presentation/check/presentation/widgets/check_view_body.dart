import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check/presentation/widgets/refuse_reason_bottom_sheet.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart' show AppRouter;
import 'pressable_button.dart';

class CheckViewBody extends StatelessWidget {
  const CheckViewBody({super.key});

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
        title: const Text('check', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // زر الإغلاق "X" باللون الأحمر
        actions: [
          IconButton(
            icon: const Icon(Icons.dangerous, color: AppColors.brightRed),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder:
                    (context) => const Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                        left: 16,
                        right: 16,
                        top: 12,
                      ),
                      child: RefuseReasonBottomSheet(),
                    ),
              );
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            /// بطاقة بيانات الشخص
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Name : Ali Emad Mossa', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 6),
                  Text(
                    'Born : 23/7/1990 Latakia',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'ID number : 00995544223311',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Property type : apartment',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Location : Damascus/Mazeh/Alhoda Circle/112 Building/4th floor.',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// زر Description Information مع تغيير اللون عند الضغط
            PressableButton(
              text: 'Description Information',
              initialColor: AppColors.lightPurple, // اللون الابتدائي
              pressedColor:
                  AppColors.lightPurple100, // اللون عند الضغط (الموف الفاتح)
              onTap: () {
                // الانتقال إلى واجهة التحقق من الممتلكات
                GoRouter.of(context).push(AppRouter.kCheckPropertyView);
              },
            ),
            const SizedBox(height: 30),

            /// زر Legal Information مع تغيير اللون عند الضغط
            PressableButton(
              text: 'Check Documents',
              initialColor: AppColors.lightPurple,
              pressedColor: AppColors.lightPurple100,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCheckDocumentView);
              },
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Center(
                child: SizedBox(
                  width: 200,

                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPurple100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: AppColors.lightPurple,
                          width: 1,
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
    );
  }
}
