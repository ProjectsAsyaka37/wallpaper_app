import 'package:flutter/material.dart';
import 'package:wallpaper_app/service/pref_handler.dart';
import 'package:wallpaper_app/utils/app_color.dart';
import 'package:wallpaper_app/utils/app_image.dart';
import 'package:wallpaper_app/screen/signin_screen.dart';
import 'package:wallpaper_app/main_page.dart';
import 'package:wallpaper_app/Screen/introduction_screen.dart'; // Import the new introduction screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    // get data user
    var userId = await PreferenceHandler.getId();
    print(userId);
    Future.delayed(Duration(seconds: 3), () {
      if (userId != '') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(email: userId, phone: userId),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IntroductionScreen(),
          ), // Navigate to introduction screen
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image.asset(
          AppImage.logo,
          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Center(child: Text('Welcome, $email')),
    );
  }

  final String phone;
  final String email;

  const MainScreen({Key? key, required this.phone, required this.email})
      : super(key: key);
}
