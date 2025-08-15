[https://github.com/user-attachments/assets/56f32de5-cc60-4ada-be71-cca9524e6f25](https://github.com/user-attachments/assets/81e3af04-aa3d-4d26-b2bd-460c860aef46)

# Jenosize Loyalty App

🚀 A scalable Flutter application built with Clean Architecture principles

## 🎯 Overview

This project demonstrates a complete mobile application solution following **Clean Architecture** principles with a focus on:

- **Scalable Apps** - Modular architecture that grows with your needs  
- **Testable Code** - Well-structured code that's easy to unit test  
- **Separation of Concerns** - Clear boundaries between different layers  
- **SOLID & DRY Principles** - Following best practices for maintainable code  

---

## 🏗️ Features 
### 1. 📋 Campaign List
- Displays a list of available campaigns using mock data
- **Join Campaign**: When users tap the "Join" button, an alert notification confirms successful campaign participation

### 2. 👥 Membership System
- **First-time Users**: New users see a "Join" button to become a member
- **Membership Registration**: User membership status is saved locally using SharedPreferences
- **Returning Users**: Previously registered users see their active membership status automatically
- **Persistent Storage**: Membership data persists across app sessions

## 3. 🔗 Referral System

- **Code Sharing**: Users can copy their referral code to clipboard
- **Share Integration**: Utilizes share_plus package for easy code sharing via social media, messaging apps, etc.
- **Friend Invitation**: Share codes with friends to invite them to join the loyalty program

## 4. 🎯 Points & Transactions

- **Points Dashboard**: Displays user's total accumulated points
- **Transaction History**: Shows complete transaction log with mock data
- **Points Tracking**: Users can monitor their earning and spending activities
- **Transaction Details**: Each transaction includes relevant information like date, amount, and transaction type

---

## 📁 Project Structure

<pre>
lib/
├── app/
│   └── routes/
│       ├── app_router.dart
│       └── route_names.dart
├── features/
│   ├── campaigns/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── pages/
│   │       └── widgets/
│   ├── membership/
│   │   ├── data/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── pages/
│   │       └── widgets/
│   ├── points/
│   │   ├── data/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── pages/
│   │       └── widgets/
│   ├── referral/
│   │   ├── data/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── pages/
│   │       └── widgets/
│   └── splash/
│       └── presentation/
│           └── pages/
├── shared/
│   └── widgets/
│       └── bottom_navigation/
│           └── constants/
│           └── models/
│           └── widgets/
└── main.dart
</pre>

## 🏗️ Architecture

The project follows **Clean Architecture** with three main layers:

---

## Layer Details:

- **Presentation Layer**: Flutter UI components, BLoC state management  
- **Domain Layer**: Business logic, use cases, entities, and repository interfaces  
- **Data Layer**: local storage, repository implementations  

---

## 🛠️ Tech Stack

**Core Framework:**
- Flutter & Dart

**State Management:**
- flutter_bloc: ^9.1.1
- equatable: ^2.0.7

**Architecture & Utilities:**
- dartz: ^0.10.1 (Functional Programming)

**Local Storage:**
- shared_preferences: ^2.5.3

**UI & UX:**
- cupertino_icons: ^1.0.8
- animated_text_kit: ^4.2.3
- flutter_native_splash: ^2.4.6

**Sharing Features:**
- share_plus: ^11.1.0

---

## 📋 Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)

---

## ⚙️ CI/CD Pipeline

This project includes automated **Continuous Integration and Continuous Deployment** using GitHub Actions:

### 🔄 **Automated Workflow (develop → main)**
- **Trigger**: Push to `develop` branch
- **Auto-merge**: Successful builds automatically merge to `main` branch

### 🧪 **Quality Assurance Steps**
- **Code Formatting**: Automated `dart format` validation
- **Static Analysis**: `flutter analyze` for code quality checks
- **Dependency Install**: Automatic package installation

### 🏗️ **Build Process**
- **APK Generation**: Builds release APK for Android
- **Artifact Storage**: Uploads build artifacts to GitHub Actions
- **Cache Management**: Cleans build caches for consistent builds

---
## 🚀 Getting Started

Follow these steps to run the Flutter app:

1. **Install dependencies**  
   Run the following command to install all required packages:  
   `flutter pub get`

2. **Run the app**  
   Launch the application using:  
   `flutter run`

