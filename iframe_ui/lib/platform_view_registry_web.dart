import 'dart:ui_web' as ui;

void registerViewFactory(String viewId, dynamic Function(int) cb) {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(viewId, cb);
}