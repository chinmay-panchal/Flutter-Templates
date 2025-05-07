import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'iframe_webview.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Dialog(
                child: SizedBox(
                  width: 600,
                  height: 500,
                  child: _LoginDialogContent(),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.login),
      ),
      body: const Center(child: Text("Main Screen")),
    );
  }
}

class _LoginDialogContent extends StatefulWidget {
  const _LoginDialogContent({super.key});

  @override
  State<_LoginDialogContent> createState() => _LoginDialogContentState();
}

// another tab
// class _LoginDialogContentState extends State<_LoginDialogContent> {
//   void _openLoginWindow() {
//     const loginUrl =
//         'https://login.xero.com/identity/user/login?ReturnUrl=%2Fidentity%2Fconnect%2Fauthorize%2Fcallback%3Fresponse_type%3Dcode%26client_id%3DC53FD729E10743DB9B35EE48FB05122B%26redirect_uri%3Dhttp%253A%252F%252Flocalhost%26scope%3Dopenid';

//     html.window.open(loginUrl, 'Xero Login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: _openLoginWindow,
//         child: const Text("Login with Xero"),
//       ),
//     );
//   }
// }

class _LoginDialogContentState extends State<_LoginDialogContent> {
  bool _showIframe = false;

  @override
  Widget build(BuildContext context) {
    if (!_showIframe) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _showIframe = true;
            });
          },
          child: const Text("Login"),
        ),
      );
    } else {
      if (kIsWeb) {
        return const IframeWebView(
            url:
                // 'http://192.168.29.81:3000/sign-in',
                'https://www.youtube.com/embed/lNPt7KOjruY'
                // 'https://flutter.dev/'
                );
      } else {
        return const Center(child: Text("Iframe only works on Flutter Web."));
      }
    }
  }
}

// class _LoginDialogContent extends StatelessWidget {
//   const _LoginDialogContent({super.key});

//   void _launchXeroLogin() {
//     const String xeroUrl = 'https://login.xero.com/identity/connect/authorize'
//         '?response_type=code'
//         '&client_id=C53FD729E10743DB9B35EE48FB05122B'
//         '&redirect_uri=http://localhost'
//         '&scope=openid';

//     html.window.open(xeroUrl, '_blank'); // Open in new tab or popup
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!kIsWeb) {
//       return const Center(child: Text("Login only works on Web"));
//     }

//     return Center(
//       child: ElevatedButton(
//         onPressed: _launchXeroLogin,
//         child: const Text("Login with Xero"),
//       ),
//     );
//   }
// }



//
