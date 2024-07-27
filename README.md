# 🏢 JuC: Just You But Corporate

JuC is an open-source project designed to help you transform your casual messages into professional emails and Teams messages. Just tell JuC what you really want to say, and it will write it professionally for you. This project is a fun and practical tool to maintain corporate communication standards effortlessly.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Firebase Setup](#firebase-setup)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

JuC aims to simplify professional communication by converting your casual language into corporate-friendly messages. Whether it's an email or a Teams message, JuC ensures your communication is always polished and professional.

## Features

- ✉️ **Email Conversion**: Transform casual language into professional email text.
- 💬 **Teams Message Formatting**: Convert informal messages to a corporate tone for Teams.
- ⚙️ **Customizable**: Tailor the level of formality and tone to suit your needs.

## Installation

To get started with JuC, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/MikesHorcrux/JuC.git
    ```
2. Navigate to the project directory:
    ```bash
    cd JuC
    ```
3. Open the project in Xcode:
    ```bash
    open JuC.xcodeproj
    ```
4. Install CocoaPods dependencies (if any):
    ```bash
    pod install
    ```

## Usage

Once the application is set up, you can start using JuC to convert your messages. Follow the in-app instructions to input your casual text and receive a polished, professional version.

## Firebase Setup

JuC requires Firebase for backend functionality. Follow these steps to set up Firebase:

1. **Create a Firebase Project**:
    - Go to [Firebase Console](https://console.firebase.google.com/).
    - Click "Add project" and follow the steps to create a new project.

2. **Add Firebase to Your iOS App**:
    - Click on "Add app" and select iOS.
    - Register your app with the iOS bundle ID.
    - Download the `GoogleService-Info.plist` file and add it to your Xcode project.

3. **Install Firebase SDK**:
    - Add the following to your `Podfile`:
    ```ruby
    platform :ios, '10.0'
    use_frameworks!

    target 'JuC' do
      pod 'Firebase/Core'
      pod 'Firebase/Firestore'
    end
    ```
    - Run `pod install` to install the Firebase SDK.

4. **Initialize Firebase in Your App**:
    - Open your `AppDelegate.swift` file and add:
    ```swift
    import Firebase

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            FirebaseApp.configure()
            return true
        }
    }
    ```

5. **Spin Up the Server**:
    - Ensure your Firebase Firestore is set up and ready to store your data.

## Contributing

We warmly welcome contributions from the community to help improve JuC! Here’s how you can contribute:

1. 🍴 Fork the repository.
2. 🌿 Create a new branch for your feature or bugfix.
3. 💾 Make your changes and commit them with clear messages.
4. 🔄 Push your changes to your fork.
5. 📥 Submit a pull request detailing your changes.

For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or suggestions, feel free to open an issue or contact us at [email@example.com](mailto:email@example.com). We look forward to hearing from you!
