// lib/presentation/check_property/presentation/widgets/property_description_widget.dart

import 'package:flutter/material.dart';

class PropertyDescriptionWidget extends StatelessWidget {
  final String space;
  final int numberOfRooms;
  final String stateName;
  final String exactPosition;
  final String propertyType;

  const PropertyDescriptionWidget({
    super.key,
    required this.space,
    required this.numberOfRooms,
    required this.stateName,
    required this.exactPosition,
    required this.propertyType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Property Description',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildInfoRow("Type", propertyType),
        _buildInfoRow("Space (m²)", space),
        _buildInfoRow("Number of Rooms", numberOfRooms.toString()),
        _buildInfoRow("State", stateName),
        _buildInfoRow("Exact Position", exactPosition),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text("$title:", style: const TextStyle(fontSize: 14)),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
