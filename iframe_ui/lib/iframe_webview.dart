import 'dart:html'; 
import 'package:flutter/material.dart';

import 'platform_view_registry_stub.dart'
    if (dart.library.html) 'platform_view_registry_web.dart';

class IframeWebView extends StatelessWidget {
  final String url;

  const IframeWebView({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    final String viewID = 'iframe-${url.hashCode}';

    // Register the iframe for Flutter Web platform views
    registerViewFactory(
      viewID,
      (int viewId) {
        final IFrameElement iframe = IFrameElement()
          ..src = url
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..allow = 'camera; microphone'
          ..allowFullscreen = true;

        return iframe;
      },
    );

    return HtmlElementView(viewType: viewID);
  }
}