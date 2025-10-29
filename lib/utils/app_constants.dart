import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';

class AppConstants {
  static String rdBaseUrl = 'https://api.real-debrid.com/rest/1.0';

  static String? apiToken;

  static Alice alice = Alice(
    configuration: AliceConfiguration(showInspectorOnShake: true),
  );
}
