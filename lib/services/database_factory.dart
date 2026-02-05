import 'package:sembast/sembast.dart';

import 'database_factory_stub.dart'
    if (dart.library.io) 'database_factory_io.dart'
    if (dart.library.html) 'database_factory_web.dart';

DatabaseFactory getDatabaseFactory() => createDatabaseFactory();
