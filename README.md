# InsightGeminiAI - Flutter App

Welcome to **InsightGemini**, your intelligent AI assistant powered by Google Gemini. This application is designed to make AI interaction seamless, efficient, and visually appealing. Whether you're sending text messages or analyzing images, InsightGemini offers cutting-edge responses with a user-friendly interface.

---

## ✨ Features

- **Text Analysis**: Engage in text-based conversations with AI for insightful responses.  
- **Image Analysis**: Upload images and let the AI provide intelligent analysis and feedback.  
- **Powered by Google Gemini**: Utilizes Google Gemini’s free model for reliable and accurate results.  
- **Modern UI/UX**: Experience a sleek, visually stunning interface with smooth animations and intuitive navigation.  
- **Clean Architecture**: Built using reusable code and best practices to ensure scalability and maintainability.  
- **State Management**: Powered by the Provider package for efficient state management.  
- **Cross-Platform**: Works seamlessly on Android and iOS devices.  

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter** ([Install Flutter](https://flutter.dev/docs/get-started/install))  
- **Dart SDK**  
- **Google Gemini API Key** ([Get Your API Key](https://cloud.google.com/gemini))  

---

### Installation

1. **Clone the repository**:  
   Clone this repository to your local machine using the following command:
   ```bash
   git clone https://github.com/flutterbasit/InsightGeminiAI.git
   ```

2. **Navigate to the project directory**:  
   Use the following command to move into the project directory:
   ```bash
   cd InsightGeminiAI
   ```

3. **Install dependencies**:  
   Fetch all the required dependencies by running:
   ```bash
   flutter pub get
   ```

4. **Add your Google Gemini API Key**:  
   Open the file where the API key is configured (e.g., `lib/constants/api_constants.dart`).  
   Replace the placeholder `YOUR_API_KEY_HERE` with your actual API key:
   ```dart
   const String geminiApiKey = 'YOUR_API_KEY_HERE';
   ```

5. **Run the app**:  
   Launch the app using the following command:
   ```bash
   flutter run
   ```

---

## 🗂 Project Structure

The project is structured using clean architecture principles to ensure scalability and maintainability:

```
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
```

---

## 🎨 Key Technologies

- **Flutter**: Framework for building beautiful, cross-platform apps.  
- **Provider**: For efficient state management.  
- **Google Gemini API**: Free AI model for text and image analysis.  
- **Lottie Animations**: For engaging UI animations.  

---

## 🤝 Contributing

Contributions are welcome! If you’d like to add a feature, fix a bug, or improve the app, feel free to open a pull request. Please make sure to follow the contribution guidelines:

1. **Fork this repository**.  
2. Create a new branch for your feature or fix:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit your changes**:
   ```bash
   git commit -m "Add your descriptive commit message"
   ```
4. **Push to your branch**:
   ```bash
   git push origin feature/your-feature-name
   ```
5. **Submit a pull request**.

---

## 📨 Contact

For any questions or suggestions, feel free to reach out:

- **Email**: flutterbasit@gmail.com  
- **GitHub**: Abdul Basit  

---

## 📢 Packages Configuration

Here is the list of packages with versions used in this project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http:
  provider:
  flutter_gemini: ^2.0.5
  image_picker: ^1.1.2
  loading_animation_widget: ^1.2.1
  shared_preferences: ^2.3.2
```

---

Thank you for exploring **InsightGeminiAI**! Feel free to use and improve this project. 🚀

