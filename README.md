# ✅ Todo App - Flutter Frontend

This is the **Flutter frontend** for a user-specific Todo application connected to a **FastAPI + Supabase backend**. It supports secure user login, token-based authorization, and full CRUD functionality for todos.

## 🎯 Features

- 🧾 User Sign Up / Log In
- 🔒 Secure API calls using Bearer Token
- 📃 View all personal Todos
- ✏️ Create, Update, and Delete Todos
- 🧭 MVC architecture with clean separation
- ⚙️ Works with deployed FastAPI backend

## 🧱 Tech Stack

- Flutter (Stateless Widgets)
- Dart
- MVC Architecture
- http package for API calls
- Token storage via flutter_secure_storage

## 🔗 Backend API

This app connects to the backend repo:  
🔗 [todo-app-backend (FastAPI)](https://github.com/Anupam00/todo_backend.git)

The backend API URL is configured securely via environment variables and not hardcoded in the source.

### 🔐 `.env`
```
API_URL=https://your-hosted-backend-api-url.com
```

⚠️ Create a `.env` file in your root directory.  
Use the hosted backend API in the `.env` file.  
This is required before running the app.

## 📁 Project Structure (Simplified)
```
lib/
├── controllers/
├── models/
├── views/
└── main.dart
```

## 📦 Frontend Dependencies

This app uses:

- Flutter 3.19.x
- GetX for state management
- HTTP for API calls
- flutter_secure_storage for auth tokens
- dotenv for environment variables

## 🚀 How to Run

```bash
flutter pub get
flutter run
```

## 📱 Try It Out

You can build and install the APK by running:

```bash
flutter build apk
```

This will generate an APK under:  
`build/app/outputs/flutter-apk/app-release.apk`

Install it manually on your Android device for testing.
