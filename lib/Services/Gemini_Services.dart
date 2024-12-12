import 'dart:io';
import 'dart:typed_data'; // For Uint8List
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  final Gemini _gemini = Gemini.instance;

  Future<String?> generateContent(
      String userMessage, File? image, String conversationHistory) async {
    try {
      List<Uint8List> imageBytesList = [];

      if (image != null) {
        Uint8List imageBytes = await image.readAsBytes();
        imageBytesList.add(imageBytes);
      }

      // Send both text and image along with the conversation history to Gemini
      final response = await _gemini.textAndImage(
        text: "$conversationHistory\nUser: $userMessage",
        images: imageBytesList,
      );

      if (response != null) {
        return response.content?.parts?.last.text ?? 'No valid content found';
      } else {
        return 'No response from Gemini';
      }
    } catch (e) {
      print('Error occurred: $e');
      return 'An error occurred while processing your message.';
    }
  }
}
