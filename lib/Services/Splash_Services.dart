// // import 'package:flutter/material.dart';
// // import 'package:insight_gpt/Resources/Constants/App_Colors.dart';

// // class LineAnimations {
// //   final AnimationController controller;
// //   final int numberOfLines;
// //   final double lineThickness;
// //   final double padding;
// //   final Color lineColor;

// //   LineAnimations({
// //     required this.controller,
// //     required this.numberOfLines,
// //     required this.lineThickness,
// //     required this.padding,
// //     required this.lineColor,
// //   });

// //   List<Widget> buildHorizontalAnimations(double width) {
// //     List<Animation<double>> lineAnimations =
// //         List.generate(numberOfLines, (index) {
// //       return Tween<double>(begin: 0, end: 1).animate(
// //         CurvedAnimation(
// //           parent: controller,
// //           curve: Interval(index * 0.5, (index + 1) * 0.5),
// //         ),
// //       );
// //     });

// //     List<Animation<double>> fadeAnimations =
// //         List.generate(numberOfLines, (index) {
// //       return Tween<double>(begin: 0, end: 1).animate(
// //         CurvedAnimation(
// //           parent: controller,
// //           curve: Interval(index * 0.5, (index + 1) * 0.5),
// //         ),
// //       );
// //     });

// //     return List.generate(numberOfLines, (i) {
// //       return AnimatedBuilder(
// //         animation: lineAnimations[i],
// //         builder: (context, child) {
// //           return Positioned(
// //             top: padding + i * (lineThickness + 40),
// //             left: lineAnimations[i].value * (width - 2 * padding),
// //             child: Opacity(
// //               opacity: fadeAnimations[i].value,
// //               child: Container(
// //                 width: width - 2 * padding,
// //                 height: lineThickness,
// //                 color: Colors.black,
// //               ),
// //             ),
// //           );
// //         },
// //       );
// //     });
// //   }

// //   List<Widget> buildVerticalAnimations(double height) {
// //     List<Animation<double>> lineAnimations =
// //         List.generate(numberOfLines, (index) {
// //       return Tween<double>(begin: 0, end: 1).animate(
// //         CurvedAnimation(
// //           parent: controller,
// //           curve: Interval(index * 0.5, (index + 1) * 0.5),
// //         ),
// //       );
// //     });

// //     List<Animation<double>> fadeAnimations =
// //         List.generate(numberOfLines, (index) {
// //       return Tween<double>(begin: 0, end: 1).animate(
// //         CurvedAnimation(
// //           parent: controller,
// //           curve: Interval(index * 0.5, (index + 1) * 0.5),
// //         ),
// //       );
// //     });

// //     return List.generate(numberOfLines, (i) {
// //       return AnimatedBuilder(
// //         animation: lineAnimations[i],
// //         builder: (context, child) {
// //           return Positioned(
// //             left: padding + i * (lineThickness + 40),
// //             top: lineAnimations[i].value * (height - 2 * padding),
// //             child: Opacity(
// //               opacity: fadeAnimations[i].value,
// //               child: Container(
// //                 width: lineThickness,
// //                 height: height - 2 * padding,
// //                 color: lineColor,
// //               ),
// //             ),
// //           );
// //         },
// //       );
// //     });
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:insight_gpt/Resources/Constants/App_Colors.dart';

// class LineAnimations {
//   final AnimationController controller;
//   final int numberOfLines;
//   final double lineThickness;
//   final double padding;
//   final Color lineColor;

//   LineAnimations({
//     required this.controller,
//     required this.numberOfLines,
//     required this.lineThickness,
//     required this.padding,
//     required this.lineColor,
//   });

//   // Method to build animations for horizontal lines (top and bottom)
//   List<Widget> buildHorizontalAnimations(double width) {
//     List<Animation<double>> lineAnimations =
//         List.generate(numberOfLines, (index) {
//       return Tween<double>(begin: 0, end: 1).animate(
//         CurvedAnimation(
//           parent: controller,
//           curve: Interval(index * 0.5,
//               (index + 1) * 0.5), // Timing for staggered animations
//         ),
//       );
//     });

//     List<Animation<double>> fadeAnimations =
//         List.generate(numberOfLines, (index) {
//       return Tween<double>(begin: 0, end: 1).animate(
//         CurvedAnimation(
//           parent: controller,
//           curve: Interval(index * 0.5, (index + 1) * 0.5),
//         ),
//       );
//     });

//     // Create lines that animate from left to right (top and bottom)
//     List<Widget> topAndBottomLines = List.generate(numberOfLines, (i) {
//       return Stack(
//         children: [
//           // Top line
//           AnimatedBuilder(
//             animation: lineAnimations[i],
//             builder: (context, child) {
//               return Positioned(
//                 top: padding + i * (lineThickness + 40),
//                 left: lineAnimations[i].value * (width - 2 * padding),
//                 child: Opacity(
//                   opacity: fadeAnimations[i].value,
//                   child: Container(
//                     width: width - 2 * padding,
//                     height: lineThickness,
//                     color: lineColor,
//                   ),
//                 ),
//               );
//             },
//           ),
//           // Bottom line (mirrored from the top)
//           AnimatedBuilder(
//             animation: lineAnimations[i],
//             builder: (context, child) {
//               return Positioned(
//                 bottom: padding + i * (lineThickness + 40),
//                 left: lineAnimations[i].value * (width - 2 * padding),
//                 child: Opacity(
//                   opacity: fadeAnimations[i].value,
//                   child: Container(
//                     width: width - 2 * padding,
//                     height: lineThickness,
//                     color: lineColor,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       );
//     });

//     return topAndBottomLines;
//   }

//   // Method to build animations for vertical lines (left and right)
//   List<Widget> buildVerticalAnimations(double height) {
//     List<Animation<double>> lineAnimations =
//         List.generate(numberOfLines, (index) {
//       return Tween<double>(begin: 0, end: 1).animate(
//         CurvedAnimation(
//           parent: controller,
//           curve: Interval(index * 0.5 + 0.5,
//               (index + 1) * 0.5 + 0.5), // Delayed after horizontal lines
//         ),
//       );
//     });

//     List<Animation<double>> fadeAnimations =
//         List.generate(numberOfLines, (index) {
//       return Tween<double>(begin: 0, end: 1).animate(
//         CurvedAnimation(
//           parent: controller,
//           curve: Interval(index * 0.5 + 0.5, (index + 1) * 0.5 + 0.5),
//         ),
//       );
//     });

//     // Create lines that animate from top to bottom (left and right)
//     List<Widget> leftAndRightLines = List.generate(numberOfLines, (i) {
//       return Stack(
//         children: [
//           // Left line
//           AnimatedBuilder(
//             animation: lineAnimations[i],
//             builder: (context, child) {
//               return Positioned(
//                 left: padding + i * (lineThickness + 40),
//                 top: lineAnimations[i].value * (height - 2 * padding),
//                 child: Opacity(
//                   opacity: fadeAnimations[i].value,
//                   child: Container(
//                     width: lineThickness,
//                     height: height - 2 * padding,
//                     color: lineColor,
//                   ),
//                 ),
//               );
//             },
//           ),
//           // Right line (mirrored from the left)
//           AnimatedBuilder(
//             animation: lineAnimations[i],
//             builder: (context, child) {
//               return Positioned(
//                 right: padding + i * (lineThickness + 40),
//                 top: lineAnimations[i].value * (height - 2 * padding),
//                 child: Opacity(
//                   opacity: fadeAnimations[i].value,
//                   child: Container(
//                     width: lineThickness,
//                     height: height - 2 * padding,
//                     color: lineColor,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       );
//     });

//     return leftAndRightLines;
//   }
// }

import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';

class LineAnimations {
  final AnimationController controller;
  final int numberOfLines;
  final double lineThickness;
  final double padding;
  final Color lineColor;

  LineAnimations({
    required this.controller,
    required this.numberOfLines,
    required this.lineThickness,
    required this.padding,
    required this.lineColor,
  });

  // Method to build animations for horizontal lines (top and bottom)
  List<Widget> buildHorizontalAnimations(double width) {
    List<Animation<double>> lineAnimations =
        List.generate(numberOfLines, (index) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              index * 0.5 / numberOfLines, (index + 1) * 0.5 / numberOfLines),
        ),
      );
    });

    List<Animation<double>> fadeAnimations =
        List.generate(numberOfLines, (index) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              index * 0.5 / numberOfLines, (index + 1) * 0.5 / numberOfLines),
        ),
      );
    });

    // Create lines that animate from left to right (top and bottom)
    List<Widget> topAndBottomLines = List.generate(numberOfLines, (i) {
      return Stack(
        children: [
          // Top line
          AnimatedBuilder(
            animation: lineAnimations[i],
            builder: (context, child) {
              return Positioned(
                top: padding + i * (lineThickness + 40),
                left: lineAnimations[i].value * (width - 2 * padding),
                child: Opacity(
                  opacity: fadeAnimations[i].value,
                  child: Container(
                    width: width - 2 * padding,
                    height: lineThickness,
                    color: lineColor,
                  ),
                ),
              );
            },
          ),
          // Bottom line (mirrored from the top)
          AnimatedBuilder(
            animation: lineAnimations[i],
            builder: (context, child) {
              return Positioned(
                bottom: padding + i * (lineThickness + 40),
                left: lineAnimations[i].value * (width - 2 * padding),
                child: Opacity(
                  opacity: fadeAnimations[i].value,
                  child: Container(
                    width: width - 2 * padding,
                    height: lineThickness,
                    color: AppColors.Intro_Text_Color,
                  ),
                ),
              );
            },
          ),
        ],
      );
    });

    return topAndBottomLines;
  }

  // Method to build animations for vertical lines (left and right)
  List<Widget> buildVerticalAnimations(double height) {
    List<Animation<double>> lineAnimations =
        List.generate(numberOfLines, (index) {
      // Adjust the intervals to stay within [0.0, 1.0]
      double start = (index * 0.5 / numberOfLines) + 0.5;
      double end = ((index + 1) * 0.5 / numberOfLines) + 0.5;

      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(start.clamp(0.0, 1.0), end.clamp(0.0, 1.0)),
        ),
      );
    });

    List<Animation<double>> fadeAnimations =
        List.generate(numberOfLines, (index) {
      double start = (index * 0.5 / numberOfLines) + 0.5;
      double end = ((index + 1) * 0.5 / numberOfLines) + 0.5;

      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(start.clamp(0.0, 1.0), end.clamp(0.0, 1.0)),
        ),
      );
    });

    // Create lines that animate from top to bottom (left and right)
    List<Widget> leftAndRightLines = List.generate(numberOfLines, (i) {
      return Stack(
        children: [
          // Left line
          AnimatedBuilder(
            animation: lineAnimations[i],
            builder: (context, child) {
              return Positioned(
                left: padding + i * (lineThickness + 40),
                top: lineAnimations[i].value * (height - 2 * padding),
                child: Opacity(
                  opacity: fadeAnimations[i].value,
                  child: Container(
                    width: lineThickness,
                    height: height - 2 * padding,
                    color: AppColors.Intro_Text_Color,
                  ),
                ),
              );
            },
          ),
          // Right line (mirrored from the left)
          AnimatedBuilder(
            animation: lineAnimations[i],
            builder: (context, child) {
              return Positioned(
                right: padding + i * (lineThickness + 40),
                top: lineAnimations[i].value * (height - 2 * padding),
                child: Opacity(
                  opacity: fadeAnimations[i].value,
                  child: Container(
                    width: lineThickness,
                    height: height - 2 * padding,
                    color: lineColor,
                  ),
                ),
              );
            },
          ),
        ],
      );
    });

    return leftAndRightLines;
  }
}
