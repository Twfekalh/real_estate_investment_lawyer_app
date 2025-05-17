import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/bloc/check_proparty_bloc.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/property_description.dart';

class CheckPropertyViewBody extends StatelessWidget {
  final int propertyId;

  const CheckPropertyViewBody({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckPropertyBloc, CheckPropertyState>(
      builder: (context, state) {
        if (state is CheckPropertyInitial) {
          context.read<CheckPropertyBloc>().add(
            FetchCheckPropertyByIdEvent(propertyId),
          );
          return const Center(child: CircularProgressIndicator());
        } else if (state is CheckPropertyLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CheckPropertyLoadedState) {
          final property = state.checkPropertyResponse.data!;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Property Details',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PropertyDescriptionWidget(
                    space: property.area ?? '',
                    numberOfRooms: property.numberOfRooms ?? 0,
                    stateName: property.state ?? '',
                    exactPosition: property.exactPosition ?? '',
                    propertyType: property.propertyType ?? '',
                  ),
                ],
              ),
            ),
          );
        } else if (state is CheckPropertyErrorState) {
          return Center(
            child: Text("حدث خطأ: ${state.helperResponse.servicesResponse}"),
          );
        }

        return const Center(child: Text("لا توجد بيانات."));
      },
    );
  }
}
