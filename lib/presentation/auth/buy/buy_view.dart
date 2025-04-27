import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/auth/buy/widgets/buy_view_body.dart';

class BayView extends StatelessWidget {
  const BayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: BayViewBody());
  }
}
