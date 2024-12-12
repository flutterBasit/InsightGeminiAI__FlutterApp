import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:provider/provider.dart';
import 'package:insight_gpt/Resources/Components/ReUsable_Container.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
import 'package:insight_gpt/Resources/Routes/Route_Name.dart';
import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart'; // Import ChatProvider

class BuildCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<Color> colors;
  final Alignment alignment;
  final String message;

  const BuildCardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.colors,
    required this.alignment,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ReusableContainer(
        elevation: 20,
        Height: height * 0.35,
        Width: width * 0.95,
        borderRadius: BorderRadius.circular(15),
        gradient: RadialGradient(colors: colors, center: alignment),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ReusableContainer(
                    Height: height * 0.05,
                    Width: width * 0.1,
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        // Sending message to Gemini and navigating to chat screen
                        final chatProvider =
                            Provider.of<ChatProvider>(context, listen: false);
                        chatProvider.sendMessageToGemini(message, null);
                        Navigator.pushNamed(
                            context, RouteName.GeminiChatScreen);
                      },
                      child: const Icon(Icons.arrow_outward),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: AppFontstyle.AppTextStyle,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                description,
                style: const TextStyle(
                    fontFamily: AppFontstyle.AppTextStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
