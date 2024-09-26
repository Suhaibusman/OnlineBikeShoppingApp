import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/button_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // The Diagonal Header
                ClipPath(
                  clipper: DiagonalClipper(),
                  child: Container(
                    height: 300,
                    color: primaryColor, // Background color
                    child:  Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: [
                            // Profile Picture
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              child: Lottie.asset("assets/userJson.json"), // Replace with your image path
                            ),
                            SizedBox(height: 10),
                            // User Name
                            Text(
                              "John Doe",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            // Email or Other Info
                            Text(
                              "johndoe@example.com",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned elements (optional)
              ],
            ),

            // The rest of the profile details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Info Cards
                  _profileInfoCard("Phone Number", Icons.phone, "123-456-7890"),
                  _profileInfoCard("Location", Icons.location_on, "New York, USA"),
                  _profileInfoCard("Joined", Icons.calendar_today, "January 2021"),

                  // Edit Profile Button
                  const SizedBox(height: 20),
                Center(child: customButtonWidget(text: "Edit Profile", onPressed: (){}, fontColor: Colors.white))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A reusable profile info card
  Widget _profileInfoCard(String title, IconData icon, String value) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Icon(icon, color: primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      ),
    );
  }
}


class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50); // Go to the bottom left
    path.lineTo(size.width, size.height); // Draw a diagonal line
    path.lineTo(size.width, 0.0); // Go to the top right
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
