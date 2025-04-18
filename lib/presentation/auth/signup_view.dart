import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/auth/widgets/custom_button.dart';
import 'package:lawyer_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:lawyer_app/untility/app_color.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/images/login_background.svg', // Ensure correct path
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push('/');
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.black46,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),

                        const Text(
                          "Sign Up",

                          style: TextStyle(
                            color: AppColors.black46,
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const CustomTextField(hintText: "Email", icon: Icons.email),
                    const SizedBox(height: 15),
                    const CustomTextField(
                      hintText: "Password",
                      icon: Icons.lock,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    const CustomTextField(
                      hintText: "Confirm Password",
                      icon: Icons.lock,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    const CustomTextField(
                      hintText: "Number",
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 44),
                    CustomButton(
                      text: "Sign Up",
                      onPressed: () {}, // Implement sign-up logic
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
