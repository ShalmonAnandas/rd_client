# RD Client

A modern Flutter application for managing Real-Debrid torrents with an intuitive and feature-rich interface.

## 📋 Overview

RD Client is a cross-platform mobile application built with Flutter that provides a seamless interface to interact with Real-Debrid's API. It allows users to manage their torrents, download files, and stream content directly from their Real-Debrid account.

## ✨ Features

### Current Features

- **📱 Torrent Management**
  - View all active torrents in your Real-Debrid account
  - Real-time torrent status updates (downloading, completed, error states)
  - Display torrent progress, speed, and seeders information
  - Detailed torrent information with file listings

- **🔗 Magnet Link Support**
  - Deep link integration for magnet URLs
  - Add torrents directly from magnet links
  - Automatic torrent import from external apps
  - Select specific files from multi-file torrents

- **⬇️ Download & Streaming**
  - Generate unrestricted download links
  - Support for streaming compatible media files
  - External player integration for video content
  - Optimized file download through Real-Debrid servers

- **🔐 Secure API Integration**
  - Secure token storage using Flutter Secure Storage
  - Easy API token configuration
  - Bearer token authentication
  - Built-in API call inspector (Alice) for debugging

- **🎨 Modern UI/UX**
  - Dark theme interface
  - Smooth animations and transitions
  - Shimmer loading effects
  - Material Design components
  - Responsive layouts for different screen sizes

- **📊 File Management**
  - File size formatting and display
  - MIME type identification
  - Multi-select file functionality
  - Host icon display for different file providers

## 📸 Screenshots

<!-- Add screenshots here -->
_Screenshots coming soon_

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.9.2 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- A Real-Debrid account with API access
- Real-Debrid API token

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ShalmonAnandas/rd_client.git
   cd rd_client
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code for models**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For a specific device
   flutter devices
   flutter run -d <device_id>
   ```

## ⚙️ Configuration

### Getting Your Real-Debrid API Token

1. Visit [Real-Debrid API](https://real-debrid.com/apitoken)
2. Log in to your account
3. Generate a new API token
4. Copy the token for use in the app

### Setting Up the API Token in App

1. Launch the RD Client app
2. Tap the settings icon (⚙️) in the top-right corner
3. Enter your Real-Debrid API token
4. Tap "Submit" to save the configuration

The token is securely stored using Flutter Secure Storage and will persist across app restarts.

## 💻 Usage

### Adding Torrents

**Method 1: Magnet Links (Recommended)**
- Share a magnet link from any app to RD Client
- The app will automatically catch the magnet URL
- Select the files you want to download
- Tap "Add Selected Files"

**Method 2: Through Other Apps**
- When you encounter a magnet link in a browser or app
- Share/Open with RD Client
- Follow the file selection process

### Viewing Torrents

1. The home screen displays all your active torrents
2. Each torrent shows:
   - Torrent name
   - Progress bar
   - Download status
   - File size
   - Download speed (if active)
   - Number of seeders

### Downloading Files

1. Tap on any completed torrent
2. You'll see a list of available files
3. Tap the play/download icon to:
   - Stream media files (if supported)
   - Download files to your device
4. Long-press on a file to open in external app

### Debugging API Calls

- Tap the settings icon
- Tap "API Calls" button
- View detailed logs of all API requests and responses using Alice inspector

## 🏗️ Technology Stack

### Core Framework
- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language

### State Management
- **GetX**: Lightweight state management solution

### Networking
- **Dio**: Powerful HTTP client for Dart
- **pretty_dio_logger**: Request/response logging
- **Alice**: HTTP inspector for debugging

### Data Persistence
- **flutter_secure_storage**: Secure token storage

### Deep Linking
- **app_links**: Universal and deep link handling
- **url_launcher**: Launch external URLs and apps

### Serialization
- **freezed**: Code generation for immutable classes
- **json_annotation**: JSON serialization
- **json_serializable**: JSON code generation

### UI Components
- **shimmer**: Loading placeholder animations
- **intl**: Internationalization and formatting

## 📁 Project Structure

```
lib/
├── main.dart                      # App entry point
├── models/                        # Data models
│   ├── torrent.dart              # Torrent model with freezed
│   ├── unrestricted_link_model.dart  # Download link model
│   └── *.g.dart / *.freezed.dart # Generated files
├── presentation/                  # UI Layer
│   ├── controllers/              # GetX controllers
│   │   ├── home_controller.dart # Home screen logic
│   │   └── torrent_controller.dart # Torrent details logic
│   └── screens/                  # App screens
│       ├── home_screen.dart     # Main torrent list
│       ├── add_torrents_screen.dart # Add torrent flow
│       └── torrent_page.dart    # Torrent details
├── services/                      # Business logic
│   ├── api_service.dart         # Real-Debrid API client
│   └── storage_service.dart     # Secure storage wrapper
├── utils/                         # Utilities
│   ├── app_constants.dart       # App-wide constants
│   └── utility_functions.dart   # Helper functions
└── widgets/                       # Reusable widgets
    ├── display_tile.dart        # Torrent item widget
    ├── display_tile_shimmer.dart # Loading placeholder
    └── token_setup_popup.dart   # API token dialog
```

## 🔌 API Integration

The app integrates with the Real-Debrid REST API v1.0:

### Endpoints Used

- `GET /torrents` - List all torrents
- `GET /torrents/info/:id` - Get single torrent details
- `POST /torrents/addMagnet` - Add magnet link
- `POST /torrents/selectFiles/:id` - Select files to download
- `POST /unrestrict/link` - Generate unrestricted download link

### API Features

- Bearer token authentication
- Request/response logging with pretty_dio_logger
- API call inspection with Alice
- Automatic request/response caching for unrestricted links
- Error handling and propagation

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes**
4. **Run the code generator if you modified models**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. **Test your changes**
   ```bash
   flutter test
   flutter analyze
   ```
6. **Commit your changes**
   ```bash
   git commit -m 'Add some amazing feature'
   ```
7. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
8. **Open a Pull Request**

### Code Style

- Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) style guide
- Use `flutter analyze` to check for issues
- Format code with `flutter format .`
- Write clear commit messages

## 🔮 Future Enhancements

### Planned Features

- **🔍 Search & Filter**
  - Search torrents by name
  - Filter by status (downloading, completed, error)
  - Sort by date, size, or progress

- **🗑️ Torrent Management**
  - Delete torrents
  - Pause/Resume downloads (if API supports)
  - Bulk operations on multiple torrents

- **📊 Statistics & Analytics**
  - Account usage statistics
  - Download history
  - Bandwidth usage charts
  - Storage space indicators

- **📲 Notifications**
  - Push notifications for completed downloads
  - Background sync for torrent status
  - Download completion alerts

- **🎨 Customization**
  - Light/Dark theme toggle
  - Custom color schemes
  - Adjustable list view layouts
  - Compact/Detailed view modes

- **💾 Offline Support**
  - Cache torrent list for offline viewing
  - Sync when back online
  - Offline file management

- **🔄 Advanced Features**
  - Torrent file upload support (.torrent files)
  - Multiple account support
  - Export download history
  - Cloud upload integration
  - RSS feed support for automatic downloads

- **🌐 Platform Expansion**
  - Web version
  - Desktop versions (Windows, macOS, Linux)
  - Tablet-optimized layouts
  - Wear OS watch app

- **🔐 Enhanced Security**
  - Biometric authentication
  - PIN lock
  - Secure mode (hide from recent apps)
  - Session timeout

- **📱 Better UX**
  - Pull-to-refresh
  - Swipe actions on torrent items
  - Share downloaded files
  - Built-in video player
  - Picture-in-Picture support

### Community Requested Features

- Multi-language support (i18n)
- Custom download directory selection
- Speed limits and scheduling
- Torrent categories and labels
- Integration with other debrid services

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Real-Debrid](https://real-debrid.com/) for their excellent API
- Flutter community for amazing packages
- All contributors who help improve this project

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/ShalmonAnandas/rd_client/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ShalmonAnandas/rd_client/discussions)
- **Email**: [Create an issue for support]

## 🔗 Links

- [Real-Debrid Website](https://real-debrid.com/)
- [Real-Debrid API Documentation](https://api.real-debrid.com/)
- [Flutter Documentation](https://flutter.dev/docs)

---

**Note**: This app is not officially affiliated with Real-Debrid. It's an independent client built using their public API.
