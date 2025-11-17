# RD Client

A comprehensive Flutter application for Real-Debrid that combines torrent management, media discovery, and seamless streaming capabilities.

## Overview

RD Client is a cross-platform Flutter application that provides a feature-rich interface for the Real-Debrid service. It integrates torrent streaming, media search, and playback tracking to deliver a complete media management experience.

## Features

### Torrent Management
- View and manage all torrents with real-time status updates
- Add magnet links via direct input or deep link integration
- Select individual files from multi-file torrents
- Generate unrestricted download links for streaming or downloading
- Automatic caching of torrent information for improved performance

### Media Discovery
- Search movies and TV shows using The Movie Database (TMDb)
- Browse detailed media information including cast, crew, and ratings
- View seasons and episodes for TV series
- Access high-quality posters and backdrop images
- Intelligent media metadata caching

### Streaming Integration
- Integration with Torrentio for direct torrent stream discovery
- Automatic detection of installed video player applications
- Launch streams directly in preferred video players
- Support for external player integration via Android intents

### Watch History & Progress
- Track playback position across all media
- Resume watching from where you left off
- View recently watched content with metadata
- Automatic cleanup of old watch history
- Progress percentage tracking

### User Experience
- Modern glassmorphic UI design with liquid glass effects
- Dark theme optimized for media consumption
- Shimmer loading states for smooth interactions
- Deep link support for magnet links and shared content
- Receive and process sharing intents from other applications

### Developer Tools
- Built-in network inspector (Alice) for API debugging
- Comprehensive request/response logging
- Secure token storage using flutter_secure_storage
- Efficient state management with GetX
- Local database caching with Sembast

### Cross-Platform Support
- Android with full feature support
- iOS compatibility
- Support for macOS, Windows, Linux, and Web platforms

## Technical Stack

- **Framework:** Flutter 3.8+
- **State Management:** GetX
- **HTTP Client:** Dio with interceptors
- **Storage:** flutter_secure_storage, Sembast
- **Code Generation:** Freezed, json_serializable
- **UI Components:** Material Design, Lucide Icons

## Acknowledgments

This project integrates with and extends the functionality of several excellent services and projects:

- **Torrentio Scraper** - [TheBeastLT/torrentio-scraper](https://github.com/TheBeastLT/torrentio-scraper) for torrent stream discovery
- **Real-Debrid API** - [api.real-debrid.com](https://api.real-debrid.com/) for premium unrestricted download service
- **The Movie Database (TMDb)** - [developer.themoviedb.org](https://developer.themoviedb.org/docs/getting-started) for comprehensive media metadata
- **Flutter** - [flutter.dev](https://flutter.dev) for the cross-platform UI framework

## License

GPLv3 - see [LICENSE](LICENSE) for details.

## Disclaimer

This application is not affiliated with or endorsed by Real-Debrid. It is an independent client that uses their publicly available API. Users must have their own Real-Debrid account to use this application.
