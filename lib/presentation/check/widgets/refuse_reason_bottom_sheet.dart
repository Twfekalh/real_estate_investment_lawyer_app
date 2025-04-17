import 'package:flutter/material.dart';
import 'package:lawyer_app/untility/app_color.dart';

class RefuseReasonBottomSheet extends StatelessWidget {
  const RefuseReasonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('refusing reason', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          const TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('send', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
