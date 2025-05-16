import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/help/presentation/widgets/help_view_item.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            HelpViewItem(
              text: 'Common Questions',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCommonQuestion);
              },
            ),
            const SizedBox(height: 20),
            HelpViewItem(
              text: 'Contact With Us',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCommonQuestion);
              },
            ),
          ],
        ),
      ),
    );
  }
}
