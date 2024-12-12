// import 'package:flutter/material.dart';
// import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
// import 'package:insight_gpt/View/GeniniChatScreen/GeminiChatScreen.dart';
// import 'package:insight_gpt/View/HomeScreen/HomeScreen.dart';
// import 'package:insight_gpt/View/IntroScreen/IntroScreen.dart';
// import 'package:insight_gpt/View/SplashScreen/SplashScreen.dart';

// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteName.IntroScreen:
//         return MaterialPageRoute(builder: (context) => IntroScreen());
//       case RouteName.SplashScreen:
//         return MaterialPageRoute(builder: (context) => SplashScreen());
//       case RouteName.HomeScreen:
//         return MaterialPageRoute(builder: (context) => Homescreen());
//       case RouteName.GeminiChatScreen:
//         return MaterialPageRoute(builder: (context) => GeminiChatScreen());
//       default:
//         return MaterialPageRoute(
//             builder: (context) => const Scaffold(
//                   body: Center(
//                     child: Text('No route defined for this screen'),
//                   ),
//                 ));
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:insight_gpt/Resources/Routes/Routes_Animatons.dart';
import 'package:insight_gpt/View/GeniniChatScreen/GeminiChatScreen.dart';
import 'package:insight_gpt/View/HomeScreen/HomeScreen.dart';
import 'package:insight_gpt/View/IntroScreen/IntroScreen.dart';
import 'package:insight_gpt/View/SplashScreen/SplashScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.IntroScreen:
        return CustomTransitions.fadeTransition(IntroScreen());
      case RouteName.SplashScreen:
        return CustomTransitions.slideTransition(SplashScreen());
      case RouteName.HomeScreen:
        return CustomTransitions.scaleTransition(Homescreen());
      case RouteName.GeminiChatScreen:
        return CustomTransitions.slideTransition(GeminiChatScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No route defined for this screen'),
                  ),
                ));
    }
  }
}
