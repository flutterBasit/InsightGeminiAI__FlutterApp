import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';

class ImagePreviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        if (chatProvider.selectedImage != null) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                chatProvider.selectedImage!,
                height: MediaQuery.of(context).size.height * 0.22,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
