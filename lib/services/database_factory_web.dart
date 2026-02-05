import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';

// Web builds use an in-memory database; cached data resets on refresh.
DatabaseFactory createDatabaseFactory() => databaseFactoryMemory;
