import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/deputization/presentation/bloc/deputizations_bloc.dart';
import 'package:lawyer_app/untility/app_color.dart';

class DeputizationItem extends StatelessWidget {
  final String userName;
  final int idNumber;
  final String status;
  final String deputizationContent;
  final String createdAt;
  final String userId;

  const DeputizationItem({
    super.key,
    required this.userName,
    required this.idNumber,
    required this.status,
    required this.deputizationContent,
    required this.createdAt,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.blue.shade100,
          child: const Icon(Icons.assignment_ind, color: Colors.blue),
        ),
        title: Text(
          userName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: $idNumber"),
            Text(
              "Status: $status",
              style: TextStyle(
                color: status == "Processed" ? Colors.green : Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Created at: ${createdAt.split('T').first}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.black54,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            builder:
                (_) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deputization Content",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          deputizationContent,
                          style: const TextStyle(fontSize: 15, height: 1.4),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            onPressed: () {
                              context.read<DeputizationsBloc>().add(
                                ProccessDeputazationEvent(
                                  id: userId.toString(),
                                ),
                              );
                              GoRouter.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}
