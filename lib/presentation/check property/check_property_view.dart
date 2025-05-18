import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/bloc/check_proparty_bloc.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/check_property_container.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/custom_button.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/property_description.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/property_type_widget.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart';

class CheckPropertyView extends StatefulWidget {
  final String propertyId;
  const CheckPropertyView({super.key, required this.propertyId});

  @override
  State<CheckPropertyView> createState() => _CheckPropertyViewState();
}

class _CheckPropertyViewState extends State<CheckPropertyView> {
  @override
  void initState() {
    super.initState();
    context.read<CheckPropertyBloc>().add(
      FetchCheckPropertyByIdEvent(int.parse(widget.propertyId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),

        title: const Text(
          'Check Property',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),

        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 38.0),
            child: Text(
              'Enter Real Estate Informatidon:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<CheckPropertyBloc, CheckPropertyState>(
              builder: (context, state) {
                if (state is CheckPropertyInitial ||
                    state is CheckPropertyLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CheckPropertyLoadedState) {
                  final property = state.checkPropertyResponse.data!;

                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            CheckPropertyContainer(child: PropertyTypeWidget()),
                            const SizedBox(height: 15),
                            CheckPropertyContainer(
                              child: PropertyDescriptionWidget(
                                space:
                                    int.tryParse(property.area ?? '') ??
                                    0, // String
                                rooms: property.numberOfRooms ?? 0, // int
                                bathrooms:
                                    property.numberOfBathrooms ?? 0, // int
                                propertyAge: property.propertyAge ?? 0, // int
                                overlook: property.overlookFrom ?? 0, // int
                                balconySize:
                                    int.tryParse(property.balconySize ?? '') ??
                                    0,
                                selectedDecoration:
                                    property.decoration ?? '', // String
                                selectedKitchen:
                                    property.kitchenType ?? '', // String
                                selectedFlooring:
                                    property.flooringType ?? '', // String
                                selectedPainting:
                                    property.paintingType ?? '', // String
                              ),
                            ),
                            SizedBox(height: 20),
                            CheckPropertyContainer(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Position Information:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Text(
                                          'State:',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          width: 107,
                                          height: 26.63,
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            property.state ?? '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Exact Position:',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Container(
                                            height: 50,
                                            padding: const EdgeInsets.all(8),
                                            alignment: Alignment.topLeft,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              property.exactPosition ?? '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 8.0,
                              ),
                              child: CustomSendButton(
                                buttonName: 'Confirm',
                                onTap: () {
                                  GoRouter.of(
                                    context,
                                  ).push(AppRouter.kCheckDocumentView);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is CheckPropertyErrorState) {
                  return Center(
                    child: Text(
                      "حدث خطأ: ${state.helperResponse.servicesResponse}",
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
