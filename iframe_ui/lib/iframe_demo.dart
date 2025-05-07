import 'dart:ui' as ui;
import 'dart:html';

import 'package:flutter/material.dart';

class IframeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidget();
  }
}

class MyWidget extends State<IframeDemo> {
  late String _url;
  late IFrameElement _iframeElement;

  @override
  initState() {
    super.initState();
    _url = 'https://flutter.dev/';
    // _url =
    //     'https://login.xero.com/identity/user/login?ReturnUrl=%2Fidentity%2Fconnect%2Fauthorize%2Fcallback%3Fresponse_type%3Dcode%26client_id%3DC53FD729E10743DB9B35EE48FB05122B%26redirect_uri%3Dhttp%253A%252F%252Flocalhost%26scope%3Dopenid';
    _iframeElement = IFrameElement()
      ..src = _url
      ..id = 'iframe'
      ..style.border = 'none';
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('url is $_url');

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 400,
            width: 400,
            child: HtmlElementView(
              viewType: 'iframeElement',
            ),
          ),
        ],
      ),
    );
  }
}
