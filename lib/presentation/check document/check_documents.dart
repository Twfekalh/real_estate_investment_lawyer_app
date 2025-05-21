import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check%20document/presentation/bloc/check_document_bloc.dart';
import 'package:lawyer_app/presentation/check%20document/presentation/widgets/image_section.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/custom_button.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/legal_check.page.model.dart';

import 'package:lawyer_app/untility/router.dart';

class CheckDocumentView extends StatelessWidget {
  const CheckDocumentView({super.key});

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
      body: BlocBuilder<CheckDocumentBloc, CheckDocumentState>(
        builder: (context, state) {
          if (state is CheckDocumentLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CheckDocumentLoadedState) {
            final data = state.checkDocumentResponse.data;

            final propertyImages =
                data?.propertyImage?.map((e) => e.path ?? '').toList() ?? [];
            final propertyDocs =
                data?.propertyDocument?.map((e) => e.path ?? '').toList() ?? [];
            final idImages =
                data?.idImages?.map((e) => e.path ?? '').toList() ?? [];

            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Check Real Estate Information:',
                          style: TextStyle(
                            color: Colors.black.withAlpha(102),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ImageSection(
                        title: "property images:",
                        images: propertyImages,
                      ),
                      const SizedBox(height: 16),
                      ImageSection(
                        title: "property documents:",
                        images: propertyDocs,
                      ),
                      const SizedBox(height: 16),
                      ImageSection(
                        title: "id images (2 faces):",
                        images: idImages,
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomSendButton(
                  buttonName: "confirm",
                  onTap: () {
                    final legalCheck = state.checkDocumentResponse.data;

                    if (legalCheck != null) {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.kCheckView, extra: legalCheck);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("لا توجد بيانات للإرسال")),
                      );
                    }
                  },
                ),
              ),
            );
          } else if (state is CheckDocumentErrorState) {
            return Center(
              child: Text("حدث خطأ: ${state.helperResponse.servicesResponse}"),
            );
          } else {
            return const Center(child: Text("لا توجد بيانات للعرض حالياً."));
          }
        },
      ),
    );
  }
}
