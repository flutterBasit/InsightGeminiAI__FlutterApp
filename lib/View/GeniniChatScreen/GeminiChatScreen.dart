// import 'package:flutter/material.dart';
// import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
// import 'package:insight_gpt/View/GeniniChatScreen/Widgets/CustomAppBar.dart';
// import 'package:insight_gpt/View/GeniniChatScreen/Widgets/ImagePreviewMessage.dart';
// import 'package:insight_gpt/View/GeniniChatScreen/Widgets/InputSectionSendMessage.dart';
// import 'package:insight_gpt/View/GeniniChatScreen/Widgets/MessageLists.dart';
// import 'package:provider/provider.dart';
// import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
// import 'package:insight_gpt/ViewModel/Theme_Provider.dart';
// import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';
// import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
// import 'package:insight_gpt/View/GeniniChatScreen/Helper/chat_Helper.dart';

// class GeminiChatScreen extends StatefulWidget {
//   const GeminiChatScreen({Key? key}) : super(key: key);

//   @override
//   State<GeminiChatScreen> createState() => _GeminiChatScreenState();
// }

// class _GeminiChatScreenState extends State<GeminiChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final ChatHelper _chatHelper = ChatHelper();
//   final FocusNode _focusNode = FocusNode();

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final chatProvider = Provider.of<ChatProvider>(context);
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;
//     final themeProvider = Provider.of<Theme_Changer_Provider>(context);

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar:
//           chatProvider.isClicked ? buildAppBar(context, height, width) : null,
//       backgroundColor: Theme.of(context).colorScheme.background,

//       endDrawer: Drawer(
//         elevation: 10,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Theme Switcher
//             RadioListTile<ThemeMode>(
//                 activeColor: Colors.blue,
//                 title: Text('LIGHT THEME',
//                     style: TextStyle(fontFamily: AppFontstyle.AppTextStyle)),
//                 value: ThemeMode.light,
//                 groupValue: themeProvider.themeMode,
//                 onChanged: (value) {
//                   themeProvider.setTheme(value!);
//                 }),
//             RadioListTile<ThemeMode>(
//                 activeColor: Colors.blue,
//                 title: Text('DARK THEME',
//                     style: TextStyle(fontFamily: AppFontstyle.AppTextStyle)),
//                 value: ThemeMode.dark,
//                 groupValue: themeProvider.themeMode,
//                 onChanged: (value) {
//                   themeProvider.setTheme(value!);
//                 }),
//             RadioListTile<ThemeMode>(
//                 activeColor: Colors.blue,
//                 title: Text('SYSTEM THEME',
//                     style: TextStyle(fontFamily: AppFontstyle.AppTextStyle)),
//                 value: ThemeMode.system,
//                 groupValue: themeProvider.themeMode,
//                 onChanged: (value) {
//                   themeProvider.setTheme(value!);
//                 }),
//           ],
//         ),
//       ),

//       body: SafeArea(
//         child: chatProvider.isClicked
//             ? Column(
//                 children: [
//                   Expanded(child: MessageListWidget()),
//                   ImagePreviewWidget(),
//                   InputSectionWidget(
//                     height: height,
//                     width: width,
//                     messageController: _messageController,
//                     chatHelper: _chatHelper,
//                   ),
//                 ],
//               )
//             : Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     chatProvider.setIsClicked(true);
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                       color: AppColors.Intro_Content_Color,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(35),
//                           topRight: Radius.circular(35),
//                           bottomLeft: Radius.circular(3),
//                           bottomRight: Radius.circular(35)),
//                     ),
//                     child: const Text(
//                       'Ask from Insight Gemini',
//                       style: TextStyle(
//                         fontFamily: AppFontstyle.AppTextStyle,
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:insight_gpt/View/GeniniChatScreen/Widgets/CustomAppBar.dart';
import 'package:insight_gpt/View/GeniniChatScreen/Widgets/ImagePreviewMessage.dart';
import 'package:insight_gpt/View/GeniniChatScreen/Widgets/InputSectionSendMessage.dart';
import 'package:insight_gpt/View/GeniniChatScreen/Widgets/MessageLists.dart';
import 'package:provider/provider.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:insight_gpt/ViewModel/Theme_Provider.dart';
import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
import 'package:insight_gpt/View/GeniniChatScreen/Helper/chat_Helper.dart';

class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({Key? key}) : super(key: key);

  @override
  State<GeminiChatScreen> createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ChatHelper _chatHelper = ChatHelper();
  final FocusNode _focusNode = FocusNode();

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Tween for the slide animation (from bottom to top)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1), // Starts off-screen (from the bottom)
      end: Offset.zero, // Ends at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation as soon as the screen is built
    _controller.forward();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _messageController.dispose();
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<Theme_Changer_Provider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:
          chatProvider.isClicked ? buildAppBar(context, height, width) : null,
      backgroundColor: Theme.of(context).colorScheme.background,
      endDrawer: Drawer(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RadioListTile<ThemeMode>(
                activeColor: Colors.blue,
                title: Text('LIGHT MODE',
                    style: TextStyle(fontFamily: AppFontstyle.AppTextStyle)),
                value: ThemeMode.light,
                groupValue: themeProvider.themeMode,
                onChanged: (value) {
                  themeProvider.setTheme(value!);
                }),
            RadioListTile<ThemeMode>(
                activeColor: Colors.blue,
                title: Text('DARK MODE',
                    style: TextStyle(fontFamily: AppFontstyle.AppTextStyle)),
                value: ThemeMode.dark,
                groupValue: themeProvider.themeMode,
                onChanged: (value) {
                  themeProvider.setTheme(value!);
                }),
            RadioListTile<ThemeMode>(
                activeColor: Colors.blue,
                title: Text('SYSTEM MODE',
                    style: TextStyle(fontFamily: AppFontstyle.AppTextStyle)),
                value: ThemeMode.system,
                groupValue: themeProvider.themeMode,
                onChanged: (value) {
                  themeProvider.setTheme(value!);
                }),
          ],
        ),
      ),
      body: SafeArea(
        child: SlideTransition(
          position:
              _animation, // Apply the animation to the entire screen content
          child: chatProvider.isClicked
              ? Column(
                  children: [
                    Expanded(child: MessageListWidget()),
                    ImagePreviewWidget(),
                    InputSectionWidget(
                      height: height,
                      width: width,
                      messageController: _messageController,
                      chatHelper: _chatHelper,
                    ),
                  ],
                )
              : Center(
                  child: GestureDetector(
                    onTap: () {
                      chatProvider.setIsClicked(true);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: AppColors.Intro_Content_Color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(35),
                        ),
                      ),
                      child: const Text(
                        'Ask from Insight Gemini',
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
