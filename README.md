InsightGeminiAI - Flutter App
Welcome to InsightGemini, your intelligent AI assistant powered by Google Gemini. This application is designed to make AI interaction seamless, efficient, and visually appealing. Whether you're sending text messages or analyzing images, InsightGemini offers cutting-edge responses with a user-friendly interface.

🌟 Features
Text Analysis: Engage in text-based conversations with AI for insightful responses.
Image Analysis: Upload images and let the AI provide intelligent analysis and feedback.
Powered by Google Gemini: Utilizes Google Gemini’s free model for reliable and accurate results.
Modern UI/UX: Experience a sleek, visually stunning interface with smooth animations and intuitive navigation.
Clean Architecture: Built using reusable code and best practices to ensure scalability and maintainability.
State Management: Powered by the Provider package for efficient state management.
Cross-Platform: Works seamlessly on Android and iOS devices.
🚀 Getting Started
Prerequisites
Flutter installed on your system (Install Flutter)
Dart SDK
Google Gemini API Key (Get Your API Key)
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/flutterbasit/InsightGeminiAI.git  
Navigate to the project directory:

bash
Copy code
cd InsightGeminiAI  
Install dependencies:

bash
Copy code
flutter pub get  
Add your Google Gemini API Key to the app:

Locate the file where the API key is stored (e.g., lib/constants/api_constants.dart).
Replace the placeholder with your API key:
dart
Copy code
const String geminiApiKey = 'YOUR_API_KEY_HERE';  
Run the app:

bash
Copy code
flutter run  

📂 Project Structure
The app is designed with clean architecture for easy maintenance and scalability.

plaintext
Copy code
InsightGeminiAI/  
├── lib/  
│   ├── models/         # Data models  
│   ├── providers/      # State management with Provider  
│   ├── services/       # API and logic services  
│   ├── screens/        # UI screens  
│   ├── widgets/        # Reusable UI components  
│   └── constants/      # App-wide constants  
├── assets/             # Images, animations, and other assets  
├── pubspec.yaml        # Dependencies  

🎨 Key Technologies
Flutter: Framework for building beautiful, cross-platform apps.
Provider: For efficient state management.
Google Gemini API: Free AI model for text and image analysis.
Lottie Animations: For engaging UI animations.

🤝 Contributing
Contributions are welcome! If you’d like to add a feature, fix a bug, or improve the app, feel free to open a pull request.

📬 Contact
For any questions or suggestions, feel free to reach out:

Email: flutterbasit@gmail.com
GitHub: Abdul Basit flutterbasit