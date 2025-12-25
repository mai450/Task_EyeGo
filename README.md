# News Explorer App

A Flutter mobile application that fetches and displays news data from a public REST API.
The app provides a smooth start screen, secure authentication using Firebase,
advanced search and filtering, and a responsive user interface.

This project was developed as part of a technical task to demonstrate Flutter development
skills, API integration, state management, and Firebase Authentication.


## App Flow Overview

- Splash Screen with animation (500ms)
- Start Screen (shown only on first app launch)
- Authentication Flow (Login / Sign Up)
- Home Screen (News browsing & search)
- News Details Screen


## Features

- Splash screen with smooth animation
- Start screen displayed only on first launch
- Firebase Authentication:
  - Email & Password login
  - Google Sign-In
- User session handling:
  - Redirects logged-in users directly to Home
- Home screen:
  - Welcome message with user name
  - Profile avatar showing the first letter of the user name
  - Side sheet for sign out
- Search functionality:
  - Dedicated search screen
  - Keyboard opens automatically
  - Search filtering options
- News display:
  - Top headlines (horizontal list)
  - Categories list
  - Category-based news (vertical list)
- News details screen:
  - Article image
  - Title, publish date, and author name
  - Full article content
- Skeleton loading using `skeletonizer`
- Optimized image loading using `cached_network_image`
- Responsive UI for different screen sizes


## Tech Stack

- Flutter & Dart
- REST API
- Dio (API networking)
- Firebase Authentication
- State Management: BLoC (Cubit)
- cached_network_image
- skeletonizer


## API Integration

- News data is fetched from a public REST API(https://newsapi.org/v2/everything?q=bitcoin&apiKey=4e07094086984950af78065d4cff86ac)
- Dio is used for handling HTTP requests
- Clean separation between data, logic, and UI layers
- Proper handling of loading, success, and error states


## Project Structure
lib/
├─ core/
│  ├─ errors/
│  ├─ helper_functions/
│  ├─ services/
│  └─ utils/
│
├─ features/
│  ├─ auth/
│  ├─ home/
│  ├─ search/
│  ├─ splash/
│  └─ start/
├─ firebase_options.dart
└─ main.dart


## Setup Instructions

# 1.Clone the repository
git clone https://github.com/mai450/Task_EyeGo.git

# 2.Install dependencies
flutter pub get

# 3.Firebase setup
Create a Firebase project
Enable Email/Password and Google Sign-In
Add google-services.json (Android)

# 4.Run the app
flutter run


## Implementation Approach

- Followed a clean and modular architecture
- Used state management to handle UI states efficiently
- Implemented reusable widgets for better maintainability
- Search and filtering are optimized for performance
- Ensured smooth navigation and user experience


## Developer ##
# Mai Awad Sadat
Mobile Application Developer using Flutter
Email: maiawad450@gmail.com
GitHub: https://github.com/mai450
LinkedIn: www.linkedin.com/in/mai-awad
Portfolio: https://mai450.github.io/
