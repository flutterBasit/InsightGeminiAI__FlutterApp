import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insight_gpt/Services/Gemini_Services.dart'; // Import the service

class ChatProvider with ChangeNotifier {
  final GeminiService _geminiService = GeminiService();
  List<Map<String, dynamic>> _messages = [];
  File? _selectedImage;
  bool _isClicked = false;
  bool _isSendIconUpward = false;
  bool _isLoading = false; // Track the overall loading state
  int _loadingMessageIndex =
      -1; // Track the index of the message that is loading

  List<Map<String, dynamic>> get messages => _messages;
  File? get selectedImage => _selectedImage;
  bool get isClicked => _isClicked;
  bool get isSendIconUpward => _isSendIconUpward;
  bool get isLoading => _isLoading; // Getter for overall loading state
  int get loadingMessageIndex =>
      _loadingMessageIndex; // Getter for the message that is loading

  void setSelectedImage(File? image) {
    _selectedImage = image;
    notifyListeners();
  }

  void clearSelectedImage() {
    _selectedImage = null;
    notifyListeners();
  }

  void setIsClicked(bool value) {
    _isClicked = value;
    notifyListeners();
  }

  void toggleSendIconUpward() {
    _isSendIconUpward = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 1), () {
      _isSendIconUpward = false;
      notifyListeners();
    });
  }

  void addUserMessage(String message, File? image) {
    _messages.add({
      'message': message,
      'image': image,
      'isUser': true,
    });
    notifyListeners();
  }

  void addGeminiMessage(String message) {
    _messages.add({
      'message': message,
      'image': null,
      'isUser': false,
    });
    notifyListeners();
  }

  String _buildConversationHistory() {
    String conversation = "";
    for (var msg in _messages) {
      conversation += msg['isUser']
          ? "User: ${msg['message']}\n"
          : "Gemini: ${msg['message']}\n";
    }
    return conversation;
  }

  // New method to update the loading state and message index
  void setLoading(bool value, int messageIndex) {
    _isLoading = value;
    _loadingMessageIndex = messageIndex;
    notifyListeners();
  }

  Future<void> sendMessageToGemini(String userMessage, File? image) async {
    if (userMessage.isEmpty && image == null)
      return; // Don't proceed if no message or image

    int currentMessageIndex = _messages.length; // Get index of the new message

    addUserMessage(userMessage, image);
    clearSelectedImage();

    // Start loading when sending the message
    setLoading(true, currentMessageIndex);

    String conversationHistory = _buildConversationHistory();
    final response = await _geminiService.generateContent(
        userMessage, image, conversationHistory);

    // Stop loading once the response is received
    setLoading(false, -1);

    if (response != null) {
      addGeminiMessage(response);
    } else {
      addGeminiMessage('Failed to get a response from Gemini.');
    }
  }
}
