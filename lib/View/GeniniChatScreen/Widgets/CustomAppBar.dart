// import 'package:flutter/material.dart';
// import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
// import 'package:insight_gpt/Resources/Components/ReUsable_Container.dart';
// import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
// import 'package:insight_gpt/ViewModel/theme_provider.dart';
// import 'package:provider/provider.dart';

// AppBar buildAppBar(BuildContext context, double height, double width) {
//   final themeChanger = Provider.of<Theme_Changer_Provider>(context);
//   return AppBar(
//     backgroundColor: Colors.white,
//     automaticallyImplyLeading: false,
//     title: Column(
//       children: [
//         Row(
//           children: [
//             InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, RouteName.HomeScreen);
//               },
//               child: ReusableContainer(
//                 Height: height * 0.05,
//                 Width: width * 0.1,
//                 borderRadius: BorderRadius.circular(10),
//                 color: AppColors.GeminiChat_Appbar_color,
//                 child: Icon(Icons.arrow_back),
//               ),
//             ),
//             SizedBox(width: width * 0.12),
//             const Text(
//               'Insight Gemini',
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(width: width * 0.08),
//             IconButton(onPressed: () {}, icon: Icon(Icons.sunny)),
//           ],
//         ),
//         const Divider(),
//       ],
//     ),
//   );
// }

// // import 'package:flutter/material.dart';
// // import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
// // import 'package:insight_gpt/Resources/Components/ReUsable_Container.dart';
// // import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
// // import 'package:provider/provider.dart';
// // import 'package:insight_gpt/ViewModel/theme_provider.dart'; // Import the ThemeProvider

// // AppBar buildAppBar(BuildContext context, double height, double width) {
// //   final theme = Theme.of(context);

// //   return AppBar(
// //     backgroundColor: theme.appBarTheme.backgroundColor, // Use the theme color
// //     automaticallyImplyLeading: false,
// //     title: Column(
// //       children: [
// //         Row(
// //           children: [
// //             InkWell(
// //               onTap: () {
// //                 Navigator.pushNamed(context, RouteName.HomeScreen);
// //               },
// //               child: ReusableContainer(
// //                 Height: height * 0.05,
// //                 Width: width * 0.1,
// //                 borderRadius: BorderRadius.circular(10),
// //                 color: AppColors.GeminiChat_Appbar_color,
// //                 child: Icon(Icons.arrow_back),
// //               ),
// //             ),
// //             SizedBox(width: width * 0.12),
// //             const Text(
// //               'Insight Gemini',
// //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
// //             ),
// //             SizedBox(width: width * 0.08),
// //             IconButton(
// //               onPressed: () {
// //                 Provider.of<ThemeProvider>(context, listen: false)
// //                     .toggleTheme();
// //               },
// //               icon: theme.brightness == Brightness.dark
// //                   ? Icon(Icons.nightlight_round) // Icon for dark mode
// //                   : Icon(Icons.wb_sunny), // Icon for light mode
// //             ),
// //           ],
// //         ),
// //         const Divider(),
// //       ],
// //     ),
// //   );
// // }

import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:insight_gpt/Resources/Components/ReUsable_Container.dart';

AppBar buildAppBar(BuildContext context, double height, double width) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.background,
    automaticallyImplyLeading: false,
    title: Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.HomeScreen);
              },
              child: ReusableContainer(
                Height: height * 0.05,
                Width: width * 0.1,
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
                child: Icon(Icons.arrow_back),
              ),
            ),
            SizedBox(width: width * 0.12),
            const Text(
              'Insight Gemini',
              style: TextStyle(
                  fontFamily: AppFontstyle.AppTextStyle,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const Divider(),
      ],
    ),
  );
}
