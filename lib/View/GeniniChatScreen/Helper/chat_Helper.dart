// // chat_helper.dart
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';

// class ChatHelper {
//   final ImagePicker _picker = ImagePicker();

//   // Function to pick an image from the gallery or camera
//   Future<void> pickImage(BuildContext context, ImageSource source) async {
//     final pickedImage = await _picker.pickImage(source: source);
//     if (pickedImage != null) {
//       Provider.of<ChatProvider>(context, listen: false)
//           .setSelectedImage(File(pickedImage.path));
//     }
//   }

//   // Send the message to Gemini via the provider
//   void sendMessage(BuildContext context, String message, File? image) {
//     if (message.trim().isEmpty && image == null) return;

//     Provider.of<ChatProvider>(context, listen: false)
//         .sendMessageToGemini(message, image);
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:insight_gpt/ViewModel/GeminiChat_Provider.dart';

class ChatHelper {
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery or camera
  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      Provider.of<ChatProvider>(context, listen: false)
          .setSelectedImage(File(pickedImage.path));
    }
  }

  // Send the message to Gemini via the provider
  bool sendMessage(BuildContext context, String message, File? image) {
    if (message.trim().isEmpty && image == null) return false;

    Provider.of<ChatProvider>(context, listen: false)
        .sendMessageToGemini(message, image);
    return true;
  }
}
