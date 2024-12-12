import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:insight_gpt/Services/splash_services.dart';
import 'package:insight_gpt/View/HomeScreen/HomeScreen.dart'; // Import your service file

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late LineAnimations _lineAnimations; // Correct type

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _lineAnimations = LineAnimations(
      controller: _controller,
      numberOfLines: 2,
      lineThickness: 4.0,
      padding: 20.0,
      lineColor: AppColors.Intro_Content_Color,
    ); // Assign instance of LineAnimations class

    // // Navigate to the home screen after 10-12 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RouteName.HomeScreen);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          // Call the buildHorizontalAnimations and buildVerticalAnimations methods
          ..._lineAnimations.buildHorizontalAnimations(width),
          ..._lineAnimations.buildVerticalAnimations(height),

          // Center text with rich text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: AppFontstyle.AppTextStyle,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'INS',
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'I',
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          fontSize: 50, // Bigger size for "I"
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'GHT ',
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'GEM',
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.Intro_Content_Color, // Color for GPT
                        ),
                      ),
                      TextSpan(
                        text: 'I',
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          fontSize: 50, // Bigger size for "I"
                          fontWeight: FontWeight.bold,
                          color: AppColors.Intro_Content_Color,
                        ),
                      ),
                      TextSpan(
                        text: 'NI',
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          fontSize: 40, // Bigger size for "I"
                          fontWeight: FontWeight.bold,
                          color: AppColors.Intro_Content_Color,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(),
                Image(image: AssetImage('assets/images/gemini.gif'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
