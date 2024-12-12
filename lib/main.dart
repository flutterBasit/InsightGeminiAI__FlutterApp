// import 'package:flutter/material.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
// import 'package:insight_gpt/Resources/Routes/Routes.dart';
// import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';
// import 'package:insight_gpt/ViewModel/Theme_Provider.dart';
// import 'package:insight_gpt/app_theme.dart';

// import 'package:provider/provider.dart';

// void main() {
//   // Initialize Gemini with your API key
//   Gemini.init(apiKey: 'AIzaSyBIvR00uDytk4EUw6_Pm1Wi_DWc_f-Fxok');
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => ChatProvider()),
//           ChangeNotifierProvider(create: (_) => Theme_Changer_Provider()),
//         ],
//         child: Builder(builder: (BuildContext context) {
//           final themeChanger = Provider.of<Theme_Changer_Provider>(context);
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             themeMode: themeChanger.themeMode,
//             theme: AppTheme.lightTheme,
//             darkTheme: AppTheme.darkTheme,
//             title: 'Insight Gemini',
//             initialRoute: RouteName.IntroScreen,
//             onGenerateRoute: Routes.generateRoute,
//           );
//         }));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:insight_gpt/Resources/Routes/Routes.dart';
import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';
import 'package:insight_gpt/ViewModel/Theme_Provider.dart';
import 'package:insight_gpt/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: 'AIzaSyBIvR00uDytk4EUw6_Pm1Wi_DWc_f-Fxok');

  final prefs = await SharedPreferences.getInstance();
  bool hasSeenIntro = prefs.getBool('hasSeenIntro') ?? false;

  runApp(MyApp(hasSeenIntro: hasSeenIntro));
}

class MyApp extends StatelessWidget {
  final bool hasSeenIntro;

  const MyApp({super.key, required this.hasSeenIntro});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => Theme_Changer_Provider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<Theme_Changer_Provider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          title: 'Insight Gemini',
          initialRoute:
              hasSeenIntro ? RouteName.SplashScreen : RouteName.IntroScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:flutter_gemini/flutter_gemini.dart';
// // import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
// // import 'package:insight_gpt/Resources/Routes/Routes.dart';
// // import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';
// // import 'package:insight_gpt/ViewModel/Theme_Provider.dart';
// // import 'package:insight_gpt/app_theme.dart';
// // import 'package:provider/provider.dart';

// // void main() {
// //   // Initialize Gemini with your API key
// //   Gemini.init(apiKey: 'AIzaSyBIvR00uDytk4EUw6_Pm1Wi_DWc_f-Fxok');
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(create: (_) => ChatProvider()),
// //         ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
// //       ],
// //       child: Builder(builder: (BuildContext context) {
// //         final themeChanger = Provider.of<ThemeChangerProvider>(context);
// //         return MaterialApp(
// //           debugShowCheckedModeBanner: false,
// //           themeMode: themeChanger.themeMode,
// //           theme: AppTheme.lightTheme,
// //           darkTheme: AppTheme.darkTheme,
// //           title: 'Insight Gemini',
// //           initialRoute: RouteName.IntroScreen,
// //           onGenerateRoute: Routes.generateRoute,
// //         );
// //       }),
// //     );
// //   }
// // }
