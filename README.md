# Community Engagement Application

A clean architecture inspired, responsive mobile application, built on Flutter Engine, to allow engagement of users within a scalable community, providing features like:

  1) Direct Messaging using text
  2) Real Time Communication using video calls
  3) React, Comment or Share posts with other users
  4) User Preferences for Recommendations.

While providing for a huge target audience, the code architecture has been simplified to a cleaner directory hierarchy and an efficient state management solution while navigating through the application, which consists of:
  - Providers: Classes implementing low level methods for requests to database.
  - Models: Data Classes for implementation of entities, and efficient querying to database.
  - Components: Individual Flutter Widgets (UI elements), which comprise different application screens.

Since this is currently an ongoing project, with the help of **MetaCall API**, we wish to port results of KNN models in python to a provider inside another dart file, reponsible for providing similar user recommendations based on collaborative filtering, based on:
  - User Demographics
  - Similar Post Engagement

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
