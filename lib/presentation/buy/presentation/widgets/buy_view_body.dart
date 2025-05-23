import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawyer_app/presentation/buy/presentation/bloc/add_images_bloc.dart';
import 'package:lawyer_app/presentation/buy/presentation/bloc/add_images_event.dart';
import 'package:lawyer_app/presentation/buy/presentation/bloc/add_images_state.dart';

import 'package:lawyer_app/presentation/buy/presentation/widgets/image_bay_section.dart';
import 'package:lawyer_app/presentation/check/presentation/widgets/refuse_reason_bottom_sheet.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/buy_request.page.model.dart';
import 'package:lawyer_app/untility/app_color.dart';

class BuyViewBody extends StatefulWidget {
  final BuyRequest buyRequest;
  const BuyViewBody({super.key, required this.buyRequest});

  @override
  State<BuyViewBody> createState() => _BuyViewBodyState();
}

class _BuyViewBodyState extends State<BuyViewBody> {
  final picker = ImagePicker();
  List<String?> idImages = [null, null];

  Future<void> pick(int index) async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => idImages[index] = file.path);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddImagesBloc, AddImagesState>(
      listener: (context, state) {
        if (state is AddImagesSuccessState) {
          // On success, show a snackbar and navigate back
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Images uploaded successfully!')),
          );
          GoRouter.of(context).pop();
        }
        if (state is AddImagesErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.helperResponse.servicesResponse}'),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AddImagesLoadingState;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => GoRouter.of(context).pop(),
            ),
            title: const Text('BUY', style: TextStyle(color: Colors.black)),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,

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
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.teal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ${widget.buyRequest.userName}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Born : ${widget.buyRequest.createdAt}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'ID number : ${widget.buyRequest.id}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Property type : ${widget.buyRequest.propertyType}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Location : ${widget.buyRequest.location}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    ImageBaySection(
                      title: "id images (2 faces):",
                      images: idImages,
                      onTap: pick,
                    ),
                    // const SizedBox(height: 20),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Center(
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              //   context.read<CheckBloc>().add(
                              //     AcceptRequestEvent(legalCheck.id!),
                              //   );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                  color: AppColors.teal,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.background,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //  if (state is CheckInLoadingState)
              //     Container(
              //       color: Colors.black38,
              //       child: const Center(child: CircularProgressIndicator()),
              //     ),
            ],
          ),
        );
      },
    );
  }
}
