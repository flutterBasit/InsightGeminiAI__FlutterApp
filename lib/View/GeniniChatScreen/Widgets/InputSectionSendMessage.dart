import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insight_gpt/Resources/Components/ReUsable_Container.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';
import 'package:insight_gpt/Resources/Constants/App_fontStyle.dart';
import 'package:insight_gpt/Utils/Utils.dart';
import 'package:insight_gpt/View/GeniniChatScreen/Helper/chat_Helper.dart';
import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';
import 'package:provider/provider.dart';

class InputSectionWidget extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController messageController;
  final ChatHelper chatHelper;

  const InputSectionWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.messageController,
    required this.chatHelper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReusableContainer(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Row(
                      children: [
                        const Icon(Icons.photo_library_outlined),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        const Text('Gallery'),
                      ],
                    ),
                    onPressed: () =>
                        chatHelper.pickImage(context, ImageSource.gallery),
                  ),
                  SizedBox(
                    width: width * 0.15,
                  ),
                  IconButton(
                    icon: Row(
                      children: [
                        const Icon(Icons.camera_alt_outlined),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        const Text('Camera'),
                      ],
                    ),
                    onPressed: () =>
                        chatHelper.pickImage(context, ImageSource.camera),
                  ),
                ],
              ),
            ),
            const Divider(indent: 30, endIndent: 30),
            Row(
              children: [
                ReusableContainer(
                  color: Theme.of(context).colorScheme.primary,
                  Height: height * 0.1,
                  Width: width * 0.8,
                  borderRadius: BorderRadius.circular(15),
                  child: SingleChildScrollView(
                    child: TextField(
                      style: const TextStyle(
                          fontFamily: AppFontstyle.AppTextStyle,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      maxLines: null,
                      maxLength: null,
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintText: 'Ask me anything...',
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    chatProvider.isSendIconUpward
                        ? Icons.arrow_outward
                        : Icons.send_rounded,
                  ),
                  color: AppColors.sendButtonColor,
                  onPressed: () {
                    if (messageController.text.isEmpty &&
                        chatProvider.selectedImage == null) {
                      showCustomSnackBar(
                        context: context,
                        message: 'Please provide a message or select an image!',
                      );
                    } else {
                      chatProvider.sendMessageToGemini(
                        messageController.text,
                        chatProvider.selectedImage,
                      );
                      messageController.clear();
                      chatProvider.setSelectedImage(null);
                      chatProvider.toggleSendIconUpward();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
