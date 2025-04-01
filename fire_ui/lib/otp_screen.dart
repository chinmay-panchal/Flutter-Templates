import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart'; // Replace with your home screen after login

class OtpScreen extends StatefulWidget {
  final String verificationId;
  OtpScreen({required this.verificationId});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyOTP() async {
    String smsCode = otpController.text.trim();
    print(widget.verificationId);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otpController.text,
    );

    try {
      final respone = await auth.signInWithCredential(credential);
      if (respone.user?.uid != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        print("error");
      }
    } catch (e) {
      print("OTP Verification Failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter OTP"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyOTP,
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}