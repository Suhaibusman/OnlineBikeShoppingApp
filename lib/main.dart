import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/screens/onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(
    Builder(
      builder: (context) {
        // Define a threshold width for the device preview
        const double thresholdWidth = 500.0; // Example threshold for larger screens
        final bool showDevicePreview = MediaQuery.of(context).size.width > thresholdWidth;

        return showDevicePreview
            ? DevicePreview(
          enabled: !kReleaseMode,
          devices: [
            Devices.android.samsungGalaxyA50,
            Devices.android.samsungGalaxyNote20,
            Devices.android.samsungGalaxyS20,
            Devices.ios.iPhone13ProMax,
            Devices.ios.iPhoneSE,
          ],
          defaultDevice: Devices.ios.iPhoneSE,
          isToolbarVisible: false, // Hide the sidebar
          availableLocales: [Locale('en', 'US')],
          builder: (context) => const MyApp(),
        )
            : const MyApp(); // Show the normal app if screen size is not large
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Bike Shopping App',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
