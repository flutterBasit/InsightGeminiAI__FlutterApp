// import 'package:flutter/material.dart';
// import 'package:insight_gpt/Resources/Components/ReUsable_Container.dart';
// import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
// import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
// import 'package:insight_gpt/Resources/Routes/Route_Name.dart';

// class IntroPageWidget extends StatelessWidget {
//   final Color color;
//   final String title;
//   final String description;
//   final String? imageAsset;
//   final bool showButton;
//   final Size size;

//   const IntroPageWidget({
//     Key? key,
//     required this.color,
//     required this.title,
//     required this.description,
//     this.imageAsset,
//     this.showButton = false,
//     required this.size,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//       child: Padding(
//         padding: EdgeInsets.all(size.width * 0.04), // Use responsive padding
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (showButton)
//               RichText(
//                 text: const TextSpan(
//                   text: '',
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: 'AI',
//                       style: TextStyle(
//                         fontFamily: AppFontstyle.AppTextStyle,
//                         color: AppColors.Intro_Content_Color, // "AI" color
//                         fontWeight: FontWeight.bold,
//                         fontSize: 75, // Adjust font size if necessary
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' IS ALWAYS AROUND',
//                       style: TextStyle(
//                         fontFamily: AppFontstyle.AppTextStyle,
//                         color: Colors.black, // Rest of the text color
//                         fontSize: 70,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             else
//               Image(image: AssetImage(imageAsset!)),
//             SizedBox(height: size.height * 0.05), // Responsive height
//             ReusableContainer(
//               elevation: 20,
//               gradient: const RadialGradient(
//                 colors: [Colors.white, Color.fromARGB(255, 187, 230, 231)],
//                 center: Alignment(-0.8, -0.8),
//               ),
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.elliptical(size.width, 90),
//                 bottom: Radius.elliptical(size.width, 90),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(13.0),
//                 child: Column(
//                   children: [
//                     SizedBox(height: size.height * 0.02),
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontFamily: AppFontstyle.AppTextStyle,
//                         fontSize: size.width * 0.07, // Responsive font size
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.Intro_Text_Color,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     Text(
//                       description,
//                       style: TextStyle(
//                         fontFamily: AppFontstyle.AppTextStyle,
//                         fontSize: size.width * 0.045, // Responsive font size
//                         color: AppColors.Intro_Text_Color,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: size.height * 0.08), // Responsive height
//             if (showButton)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: AppColors.Intro_Text_Color,
//                       backgroundColor: AppColors.Elevated_Button_Color,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       elevation: 10,
//                     ),
//                     child: Icon(
//                       Icons.navigate_before,
//                       size: size.width * 0.1, // Responsive icon size
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the next screen
//                       Navigator.pushReplacementNamed(
//                           context, RouteName.SplashScreen);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black,
//                       backgroundColor: Colors.white70,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: size.width * 0.08, // Responsive padding
//                         vertical: size.height * 0.02,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       elevation: 10,
//                     ),
//                     child: Text(
//                       'Skip',
//                       style: TextStyle(
//                           fontFamily: AppFontstyle.AppTextStyle,
//                           fontWeight: FontWeight.bold,
//                           fontSize: size.width * 0.045),
//                     ),
//                   ),
//                 ],
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Components/ReUsable_Container.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPageWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final String? imageAsset;
  final bool showButton;
  final Size size;

  const IntroPageWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    this.imageAsset,
    this.showButton = false,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04), // Use responsive padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showButton)
              RichText(
                text: const TextSpan(
                  text: '',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'AI',
                      style: TextStyle(
                        fontFamily: AppFontstyle.AppTextStyle,
                        color: AppColors.Intro_Content_Color, // "AI" color
                        fontWeight: FontWeight.bold,
                        fontSize: 75, // Font size for "AI"
                      ),
                    ),
                    TextSpan(
                      text: ' IS ALWAYS AROUND',
                      style: TextStyle(
                        fontFamily: AppFontstyle.AppTextStyle,
                        color: Colors.black, // Color for "IS ALWAYS AROUND"
                        fontSize: 70, // Font size for rest of the text
                      ),
                    ),
                  ],
                ),
              )
            else
              Image(image: AssetImage(imageAsset!)),
            SizedBox(height: size.height * 0.05), // Responsive height

            ReusableContainer(
              elevation: 20,
              gradient: const RadialGradient(
                colors: [Colors.white, Color.fromARGB(255, 187, 230, 231)],
                center: Alignment(-0.8, -0.8),
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(size.width, 90),
                bottom: Radius.elliptical(size.width, 90),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: AppFontstyle.AppTextStyle,
                        fontSize: size.width * 0.07, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: AppColors.Intro_Text_Color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      description,
                      style: TextStyle(
                        fontFamily: AppFontstyle.AppTextStyle,
                        fontSize: size.width * 0.045, // Responsive font size
                        color: AppColors.Intro_Text_Color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.08), // Responsive height

            if (showButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.Intro_Text_Color,
                      backgroundColor: AppColors.Elevated_Button_Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                    ),
                    child: Icon(
                      Icons.navigate_before,
                      size: size.width * 0.1, // Responsive icon size
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save to shared preferences that intro screen has been seen
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('hasSeenIntro', true);

                      // Navigate to the next screen
                      Navigator.pushReplacementNamed(
                          context, RouteName.SplashScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white70,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08, // Responsive padding
                        vertical: size.height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontFamily: AppFontstyle.AppTextStyle,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.045, // Responsive font size
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
