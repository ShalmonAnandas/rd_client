class UtilityFunctions {
  static String formatBytes(int bytes, [int decimals = 2]) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    double size = bytes.toDouble();
    int i = 0;

    if (size >= 1 << 40) {
      i = 4; // TB
      size = size / (1 << 40);
    } else if (size >= 1 << 30) {
      i = 3; // GB
      size = size / (1 << 30);
    } else if (size >= 1 << 20) {
      i = 2; // MB
      size = size / (1 << 20);
    } else if (size >= 1 << 10) {
      i = 1; // KB
      size = size / (1 << 10);
    }

    // If GB is less than 1, go down to MB
    if (i == 3 && size < 1) {
      i = 2;
      size = bytes / (1 << 20);
    }

    return "${size.toStringAsFixed(decimals)} ${suffixes[i]}";
  }
}
