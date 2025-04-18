import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check%20document/widgets/image_section.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/custom_button.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart';

class CheckDocumentView extends StatelessWidget {
  final List<String> propertyImages = List.filled(
    6,
    'assets/images/sample.png',
  );
  final List<String> propertyDocs = List.filled(6, 'assets/images/sample.png');
  final List<String> idImages = List.filled(2, 'assets/images/sample.png');

  CheckDocumentView({super.key});

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
          'Check Documents',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Check Real Estate Informatidon:',
                  style: TextStyle(
                    color: Colors.black.withAlpha(102),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ImageSection(title: "property images:", images: propertyImages),
              SizedBox(height: 16),
              ImageSection(title: "property documents:", images: propertyDocs),
              SizedBox(height: 16),
              ImageSection(title: "id images (2 faces):", images: idImages),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomSendButton(
                  buttonName: "confirm",
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kCheckView);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
