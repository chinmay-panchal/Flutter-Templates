import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_fire/Provider/signinservice.dart';
import 'package:new_fire/Provider/firestore_service.dart';
import 'package:new_fire/Screen/Loginscreen/Loginscreen.dart';
import 'package:new_fire/others/futureexample.dart';
import 'package:new_fire/Models/taskitem.dart';
import 'package:new_fire/others/taskprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Taskprovider()),
        FutureProvider<int>(
          create: (_) => Futureexample().fetchdata(),
          initialData: 0,
        ),
        StreamProvider<List<Taskitem>>(
          create: (context) => FirestoreService().tasksStream(),
          initialData: [],
        ),
        Provider<String>(create: (_) => "Anonymous Screen"),
        Provider<Signinservice>(
          create: (_) => Signinservice(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homescreen(),
      ),
    );
  }
}
