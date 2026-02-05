import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';

// Web builds use an in-memory database; cached media details, watch history, and
// stream data reset on refresh, so users will need to reload cached content.
DatabaseFactory createDatabaseFactory() => databaseFactoryMemory;
