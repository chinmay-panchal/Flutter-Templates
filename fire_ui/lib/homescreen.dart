import 'package:fire_ui/phone_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'signup.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Email & Password Login
  Future<void> signInWithEmailPassword(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("Signed in as: ${userCredential.user?.email}");

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isLoggedIn', true);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uId', userCredential.user!.uid.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: ${e.toString()}")),
      );
    }
  }

  // Anonymous Login
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print("Signed in as: ${userCredential.user?.uid}");

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isLoggedIn', true);

        SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uId', userCredential.user!.uid.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  // Google Sign-In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("Google sign-in cancelled");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print("Signed in as: ${userCredential.user?.displayName}");

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isLoggedIn', true);

        SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uId', userCredential.user!.uid.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In Failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/background.png'),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                        const Divider(),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => signInWithEmailPassword(context),
                  child: const Text('Login with Email'),
                ),
                ElevatedButton(
                  onPressed: () => signInAnonymously(context),
                  child: const Text('Login Anonymously'),
                ),
                ElevatedButton.icon(
                  onPressed: () => signInWithGoogle(context),
                  icon:
                      Image.asset('assets/images/google_logo.png', height: 24),
                  label: const Text('Login with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhoneAuthScreen()),
                    );
                  },
                  child: const Text('Login with Phone'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text("Don't have an account? Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
