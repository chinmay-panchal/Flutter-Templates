import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Providers/themeProvider.dart';
import 'package:flutter_practical/Screens/DashboardScreen/DashboardScreen.dart';
import 'package:flutter_practical/Screens/LoginScreen/loginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? uid = await getUserUID();

  runApp(MyApp(uid: uid));
}

class MyApp extends StatelessWidget {
  final String? uid;

  const MyApp({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411.42857142857144, 707.4285714285714),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => Themeprovider()),
              ],
              child: Builder(builder: (BuildContext context) {
                // final themeChanger = context.read<Themeprovider>();
                return Consumer<Themeprovider>(
                    builder: (context, value, child) {
                  print(value.themeMode);
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    themeMode: value.themeMode,
                    theme: ThemeData.light(),
                    darkTheme: ThemeData.dark(),
                    home: uid == null ? Loginscreen() : Dashboardscreen(),
                  );
                });
              }));
        });
  }
}

Future<String?> getUserUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('uId'); // Returns UID if exists, else null
  // print("Stored UID: $storedUid");
}
