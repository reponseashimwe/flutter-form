# Flutter Form - Multi-Step Form

A Flutter application designed for conducting student surveys with a focus on multi-step forms, validation, and modern design principles. This project serves as a template for building a cross-platform application using Flutter.

## Getting Started

This project is a starting point for a Flutter application. To get started, ensure you have Flutter installed on your machine. You can follow the official Flutter installation guide [here](https://flutter.dev/docs/get-started/install).

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE (e.g., Android Studio, Visual Studio Code)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/reponseashimwe/flutter-form.git
   cd flutter-form
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

## Features

- **Multi-Step Forms**: The application allows users to complete surveys in multiple steps, enhancing user experience and engagement.
- **Form Validation**: Each step includes validation to ensure that user inputs are correct before proceeding to the next step.
- **Responsive Design**: The UI is designed to be responsive across different devices and screen sizes.
- **Customizable UI**: The application uses Flutter's Material Design components, allowing for easy customization of themes and styles.

## Project Structure

```
form/
├── android/                # Android-specific files
├── ios/                    # iOS-specific files
├── lib/                    # Dart code for the application
│   ├── main.dart           # Entry point of the application
│   ├── screens/            # UI screens
│   │   ├── welcome_screen.dart  # Welcome screen
│   │   └── survey/         # Multi-step survey screens
│   │       ├── step_one.dart     # First step of the survey
│   │       ├── step_two.dart     # Second step of the survey
│   │       └── step_three.dart   # Final step of the survey
│   └── widgets/            # Custom widgets (e.g., text fields, buttons)
├── macos/                  # macOS-specific files
├── linux/                  # Linux-specific files
├── windows/                # Windows-specific files
├── pubspec.yaml            # Flutter project configuration
└── README.md               # Project documentation
```

## Form Handling

The application implements a multi-step form process where users can fill out the survey in stages. Each step is validated to ensure that all required fields are completed correctly before moving on.

### Validation

- Each input field includes validation logic to provide immediate feedback to users.
- Error messages are displayed next to the relevant fields to guide users in correcting their inputs.

## Design Principles

- **Material Design**: The application follows Material Design guidelines to provide a clean and modern user interface.
- **Responsive Layout**: The layout adapts to different screen sizes, ensuring a consistent experience across devices.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or features.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
