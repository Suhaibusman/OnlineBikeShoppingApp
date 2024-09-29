import 'package:oneline_bike_shopping_app/utils/widget/blue_button_widget.dart';
import 'package:oneline_bike_shopping_app/utils/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

import '../../bottom_nav_bar/bottom_nav_bar.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Create a GlobalKey for the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: primaryColor,
      body: Container(
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
            key: _formKey, // Assign the form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png", height: 100, width: 100),
                SizedBox(height: 20),
                customTextWidget(
                  text: 'Welcome Back!',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                SizedBox(height: 40),

                // Email TextField with validation
                CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                  icon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Password TextField with validation
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
                SizedBox(height: 30),

                // Login Button with validation check
                customBlueButtonWidget(
                  text: "Login",
                  buttonHeight: 40,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, navigate to the BottomNavBar screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                      );
                    }
                  },
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20),

                // Signup Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextWidget(
                      text: 'Don\'t have an account?',
                      color: Colors.white,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()),
                        );
                      },
                      child: customTextWidget(
                        text: 'Sign Up',
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
