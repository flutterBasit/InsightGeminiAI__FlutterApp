import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
import 'package:insight_gpt/View/IntroScreen/Widgets/BuildPage.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          IntroPageWidget(
            color: AppColors.Intro_BackGround_White,
            title: 'Welcome to Insight Gemini',
            description:
                'Your personal AI assistant that understands both words and images. Experience the power of advanced AI, designed to help you in ways you never thought possible.',
            imageAsset: 'assets/images/AI.png', // Add your image assets
            size: size,
          ),
          IntroPageWidget(
            color: AppColors.Intro_BackGround_White,
            title: 'Ready to Explore?',
            description:
                'Take your first step into the future of communication. Let Insight Gemini assist you in navigating through text, images, and more with the \n power of AI.',
            showButton: true,
            size: size,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
