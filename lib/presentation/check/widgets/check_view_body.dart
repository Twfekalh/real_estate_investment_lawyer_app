import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart' show AppRouter;
import 'pressable_button.dart'; // تأكد من استيراد الملف الذي فيه PressableButton

class CheckViewBody extends StatelessWidget {
  const CheckViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('check', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // زر الإغلاق "X" باللون الأحمر
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cancel_presentation_rounded,
              color: AppColors.brightRed,
            ),
            onPressed: () {
              Navigator.pop(context);
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
                  Text('Name : Ali Emad Mossa', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 6),
                  Text(
                    'Born : 23/7/1990 Latakia',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'ID number : 00995544223311',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Property type : apartment',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Location : Damascus/Mazeh/Alhoda Circle/112 Building/4th floor.',
                    style: TextStyle(fontSize: 14),
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
            const SizedBox(height: 16),

            /// زر Legal Information مع تغيير اللون عند الضغط
            PressableButton(
              text: 'Legal Information',
              initialColor: AppColors.lightPurple,
              pressedColor: AppColors.lightPurple100,
              onTap: () {
                // انتقل إلى الصفحة القانونية أو أي صفحة أخرى
                GoRouter.of(context).push(AppRouter.kCheckPropertyView);
              },
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightPurple100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
