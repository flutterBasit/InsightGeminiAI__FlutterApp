import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:provider/provider.dart';
import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';

class MessageListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return ListView.builder(
          itemCount: chatProvider.messages.length,
          reverse: true,
          itemBuilder: (context, index) {
            final message =
                chatProvider.messages[chatProvider.messages.length - index - 1];
            final bool isUser = message['isUser'];
            final int messageIndex = chatProvider.messages.length - index - 1;

            Widget messageBubble =
                _buildMessageBubble(context, message, isUser);

            if (chatProvider.isLoading &&
                chatProvider.loadingMessageIndex == messageIndex) {
              return Column(
                children: [
                  messageBubble,
                  Row(
                    children: [
                      SizedBox(width: 10),
                      LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.Intro_Content_Color,
                        size: 35,
                      ),
                    ],
                  ),
                ],
              );
            }

            if (!isUser) {
              return Row(
                children: [
                  Expanded(child: messageBubble),
                  IconButton(
                    icon: Icon(Icons.copy, color: Colors.grey),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: message['message']));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Copied to clipboard!')),
                      );
                    },
                  ),
                ],
              );
            }

            return messageBubble;
          },
        );
      },
    );
  }

  Widget _buildMessageBubble(
      BuildContext context, Map<String, dynamic> message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isUser ? Colors.blue : AppColors.Intro_Content_Color,
            borderRadius: isUser
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(5))
                : BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.all(12),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: message['image'] != null
              ? Column(
                  children: [
                    Image.file(message['image']),
                    if (message['message'].isNotEmpty)
                      Text(
                        message['message'],
                        style: TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          color: isUser ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                  ],
                )
              : Text(
                  message['message'],
                  style: TextStyle(
                    fontFamily: AppFontstyle.AppTextStyle,
                    color: isUser ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
