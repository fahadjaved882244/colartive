# Colartive - Artistic Wallpaper Generation

Colartive is a cross-platform mobile application built using Flutter, designed to empower users to create stunning, device-optimized 4K wallpapers.  Leveraging the power of Flutter's Canvas and CustomPainter, Colartive generates unique and visually appealing artwork tailored perfectly to the device's pixel ratio and dimensions.  Users can choose from a variety of templates, customize colors, apply transformations, and even add text to personalize their creations.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Screenshots](#screenshots)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Future Enhancements](#future-enhancements)
- [Author](#author)
- [License](#license)

## Introduction

In today's digital age, personalizing our devices is paramount. Colartive offers a unique approach to wallpaper customization, moving beyond static images to dynamic, user-generated art.  By harnessing the flexibility of Flutter's drawing capabilities, Colartive produces high-resolution artwork that seamlessly integrates with any device, ensuring crisp visuals and a truly personalized experience.

## Features

* **4K Wallpaper Generation:**  Generates high-resolution artwork tailored to the device's specific dimensions and pixel ratio for optimal display.
* **Cross-Platform Compatibility:** Built with Flutter, ensuring seamless performance across both Android and iOS platforms.
* **Diverse Templates:** Offers a variety of starting templates to inspire creativity and provide a foundation for unique designs.
* **Customizable Colors:**  Allows users to select and apply custom color palettes to their artwork.
* **Transformations:**  Provides various transformations (e.g., rotation, scaling, skewing) to manipulate and refine the generated art.
* **Text Overlay:**  Enables users to add personalized text to their creations, making each wallpaper truly unique.
* **Intuitive User Interface:**  Designed for ease of use, allowing users to quickly create and apply their custom wallpapers.
* **Offline Functionality:**  Generate wallpapers without an internet connection.

## Screenshots

*(Include screenshots of the app here.  Showcasing different templates, customization options, and the final output.  Consider using a carousel or grid layout for multiple screenshots.)*

## Technology Stack

* **Flutter:** The primary framework for building the cross-platform mobile application.
* **Dart:** The programming language used for Flutter development.
* **CustomPainter:** Utilized for creating the custom art generation logic.
* **Flutter Canvas:**  The drawing surface used for rendering the artwork.
* **Firebase:**  For Authentication, Database, and Cloud Storage.


| SDLC Phase      | Technologies Used |
|---------------|-----------------|
| **Planning**   | Google Docs |
| **Architecture**     | StarUML |
| **Development** | Flutter, Riverpod, GoRouter  |
| **Database** | Firebase  |
| **Testing**    | Unit Testing, Widget Testing |
| **Deployment** | Google Play Store, Apple App Store  |
| **CI/CD** | TODO |

## Architecture

This Flutter project follows a **Feature-First** approach combined with the **MVC (Model-View-Controller) architecture** to ensure modularity, scalability, and maintainability. Below is the directory structure:

```
project_root/
│── lib/
│   │   
│   │── core/			# Contains global utilities, constants, and shared services
│   │   
│   │── data/			# Handles data sources (APIs, local storage, etc.)
│   │   
│   │── features/		# Organizes code by feature
│   │   │── feature_name/
│   │   │   │── data/	       # Repositories for fetching remote and local data
│   │   │   │── model/		   # Data structures and domain models
│   │   │   │── views/        # UI components and widgets
│   │   │       │── components/         # Reusable widgets specific to the feature 
│   │   │       │── controller.dart     # Business logic and state management
│   │   │       │── view.dart           # UI code of the specific feature
│   │   │
│   │── routes/      # Handles app navigation
│   │── main.dart    # Application entry point
│
│── assets/			# Contains images, fonts, and other static resources
│── pubspec.yaml	# Dependencies and project metadata
│── README.md		# Project documentation
```

Each feature within the `features/` directory is self-contained, following the MVC pattern to maintain a clean separation of concerns.


---


## Installation

1. Ensure you have Flutter installed and configured on your development machine.  See the official Flutter documentation for instructions: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2. Clone the repository: `git clone https://github.com/[your-username]/Colartive.git`
3. Navigate to the project directory: `cd Colartive`
4. Install dependencies: `flutter pub get`
5. Connect your device or start an emulator.
6. Run the app: `flutter run`

## Usage

1. Launch the Colartive app.
2. Browse the available templates.
3. Select a template to begin customizing.
4. Choose your desired colors and apply transformations.
5. Add text if desired.
6. Preview your creation.
7. Save and apply the generated wallpaper to your device.

## Contributing

Contributions are welcome!  Please open an issue or submit a pull request for any bug fixes, feature requests, or improvements.

## Future Enhancements

* **More Templates:** Expand the library of available templates.
* **Advanced Transformations:** Implement more complex transformations and effects.
* **Cloud Integration:**  Allow users to save and share their creations.
* **User Accounts:** Enable user accounts for personalized template management.
* **Animation:** Explore incorporating subtle animations into the generated artwork.

## Author

If you have any questions or feedback, feel free to reach out:

**Author: Fahad Javed**

Email: fahadjaved882244@gmail.com

LinkedIn: linkedin.com/fahadjaved882244

GitHub: github.com/fahadjaved882244

## License

This project is licensed under the MIT License. See the LICENSE file for details.

