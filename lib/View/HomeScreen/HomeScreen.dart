// import 'package:flutter/material.dart';

// import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
// import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
// import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
// import 'package:insight_gpt/View/HomeScreen/wisgets/BuikdCard.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             const SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(15.0),
//                     child: Text(
//                       "EXPLORE",
//                       style: TextStyle(
//                           fontFamily: AppFontstyle.AppTextStyle,
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   BuildCardWidget(
//                     title: "Finding Information",
//                     description:
//                         "I can search the internet for the answers to your questions and provide you with relevant information on any topic.",
//                     colors: [
//                       AppColors.Intro_BackGround_White,
//                       Color(0xff54ea54),
//                     ],
//                     alignment: Alignment(-0.95, -0.9),
//                     message: "Tell me more about finding information.",
//                   ),
//                   BuildCardWidget(
//                     title: "Entertainment",
//                     description:
//                         "You can ask me to play music, tell a joke, or provide interesting facts.",
//                     colors: [
//                       AppColors.Intro_BackGround_White,
//                       Color(0xffa98aff),
//                     ],
//                     alignment: Alignment(0.95, 0.9),
//                     message: "Tell me a joke or play music.",
//                   ),
//                   BuildCardWidget(
//                     title: "Planning Assistance",
//                     description:
//                         "You can ask me about different schedules, and can plan trips. I will provide you with relevant information.",
//                     colors: [
//                       AppColors.Intro_BackGround_White,
//                       Color(0xff00b6e0),
//                     ],
//                     alignment: Alignment(-0.95, -0.9),
//                     message: "Help me plan my next trip.",
//                   ),
//                   BuildCardWidget(
//                     title: "Health & Well-being",
//                     description:
//                         "Ask me about maintaining a balanced lifestyle, health tips, or daily fitness routines.",
//                     colors: [
//                       AppColors.Intro_BackGround_White,
//                       Color.fromARGB(255, 83, 125, 134),
//                     ],
//                     alignment: Alignment(0.95, 0.9),
//                     message: "Give me health tips.",
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               right: 30,
//               child: FloatingActionButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, RouteName.GeminiChatScreen);
//                 },
//                 backgroundColor: AppColors.Intro_BackGround_White,
//                 child: const Text(
//                   'Skip',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: AppColors.Intro_Text_Color,
//                   ),
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 10,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:insight_gpt/View/HomeScreen/wisgets/BuikdCard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _exploreAnimation;
  late Animation<Offset> _skipButtonAnimation;
  late Animation<Offset> _cardAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller with 5 seconds duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Explore text animation (left to right)
    _exploreAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Skip button animation (bottom to up)
    _skipButtonAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5), // Start offscreen (bottom)
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Card animation (left to right)
    _cardAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0), // Start offscreen (left)
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Animated Explore Text
                  SlideTransition(
                    position: _exploreAnimation,
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "EXPLORE",
                        style: TextStyle(
                            fontFamily: AppFontstyle.AppTextStyle,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  _buildAnimatedCard(
                    title: "Finding Information",
                    description:
                        "I can search the internet for the answers to your questions and provide you with relevant information on any topic.",
                    colors: [
                      AppColors.Intro_BackGround_White,
                      const Color(0xff54ea54),
                    ],
                    alignment: const Alignment(-0.95, -0.9),
                    message: "Tell me more about finding information.",
                  ),
                  _buildAnimatedCard(
                    title: "Entertainment",
                    description:
                        "You can ask me to play music, tell a joke, or provide interesting facts.",
                    colors: [
                      AppColors.Intro_BackGround_White,
                      const Color(0xffa98aff),
                    ],
                    alignment: const Alignment(0.95, 0.9),
                    message: "Tell me a joke or play music.",
                  ),
                  _buildAnimatedCard(
                    title: "Planning Assistance",
                    description:
                        "You can ask me about different schedules, and can plan trips. I will provide you with relevant information.",
                    colors: [
                      AppColors.Intro_BackGround_White,
                      const Color(0xff00b6e0),
                    ],
                    alignment: const Alignment(-0.95, -0.9),
                    message: "Help me plan my next trip.",
                  ),
                  _buildAnimatedCard(
                    title: "Health & Well-being",
                    description:
                        "Ask me about maintaining a balanced lifestyle, health tips, or daily fitness routines.",
                    colors: [
                      AppColors.Intro_BackGround_White,
                      const Color.fromARGB(255, 83, 125, 134),
                    ],
                    alignment: const Alignment(0.95, 0.9),
                    message: "Give me health tips.",
                  ),
                ],
              ),
            ),
            // Animated Skip Button
            Positioned(
              bottom: 20,
              right: 30,
              child: SlideTransition(
                position: _skipButtonAnimation,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.GeminiChatScreen);
                  },
                  backgroundColor: AppColors.Intro_BackGround_White,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.Intro_Text_Color,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the animated card widget
  Widget _buildAnimatedCard({
    required String title,
    required String description,
    required List<Color> colors,
    required Alignment alignment,
    required String message,
  }) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _cardAnimation,
          child: BuildCardWidget(
            title: title,
            description: description,
            colors: colors,
            alignment: alignment,
            message: message,
          ),
        );
      },
    );
  }
}
