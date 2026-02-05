import 'web_reload_stub.dart'
    if (dart.library.html) 'web_reload_web.dart';

void triggerWebReload() => reloadImpl();
