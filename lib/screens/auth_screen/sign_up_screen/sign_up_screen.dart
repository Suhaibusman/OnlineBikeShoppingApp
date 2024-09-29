import 'package:oneline_bike_shopping_app/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:oneline_bike_shopping_app/utils/widget/blue_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

import '../../../utils/widget/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
          ),
          // borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(30),
          //   bottomRight: Radius.circular(30),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png", height: 100, width: 100),
                SizedBox(height: 20),
                customTextWidget(
                  text: 'Create an Account',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 40),

                // Email TextField
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  hintText: 'Email',
                  controller: emailController,
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),

                // Password TextField
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Confirm Password TextField
                CustomTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: true,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Signup Button

                customBlueButtonWidget(
                    text: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ));
                    },
                    fontColor: Colors.white,
                    // buttonColor: Colors.white ,

                    buttonHeight: 40,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 20),

                // Login Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextWidget(
                      text: 'Already have an account?',
                      color: Colors.white,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: customTextWidget(
                        text: 'Login',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
