import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:discuss_hub_project/core/common/error_text.dart';
import 'package:discuss_hub_project/core/common/loader.dart';
import 'package:discuss_hub_project/features/auth/controlller/auth_controller.dart';
import 'package:discuss_hub_project/firebase_options.dart';
import 'package:discuss_hub_project/router.dart';
import 'package:discuss_hub_project/theme/pallete.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    final userModel = ref.watch(userProvider);

    return authState.when(
      data: (data) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Reddit Clone',
          theme: ref.watch(themeNotifierProvider),
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (context) {
              if (data != null && userModel != null) {
                return loggedInRoute;
              }
              return loggedOutRoute;
            },
          ),
          routeInformationParser: const RoutemasterParser(),
        );
      },
      loading: () => const Loader(),
      error: (err, stack) => ErrorText(error: err.toString()),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:discuss_hub_project/core/common/error_text.dart';
// import 'package:discuss_hub_project/core/common/loader.dart';
// import 'package:discuss_hub_project/features/auth/controlller/auth_controller.dart';
// import 'package:discuss_hub_project/firebase_options.dart';
// import 'package:discuss_hub_project/models/user_model.dart';
// import 'package:discuss_hub_project/router.dart';
// import 'package:discuss_hub_project/theme/pallete.dart';
// import 'package:routemaster/routemaster.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends ConsumerStatefulWidget {
//   const MyApp({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
// }

// class _MyAppState extends ConsumerState<MyApp> {
//   UserModel? userModel;

//   void getData(WidgetRef ref, User data) async {
//     userModel = await ref
//         .watch(authControllerProvider.notifier)
//         .getUserData(data.uid)
//         .first;
//     ref.read(userProvider.notifier).update((state) => userModel);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ref.watch(authStateChangeProvider).when(
//           data: (data) => MaterialApp.router(
//             debugShowCheckedModeBanner: false,
//             title: 'Reddit Tutorial',
//             theme: ref.watch(themeNotifierProvider),
//             routerDelegate: RoutemasterDelegate(
//               routesBuilder: (context) {
//                 if (data != null) {
//                   getData(ref, data);
//                   if (userModel != null) {
//                     return loggedInRoute;
//                   }
//                 }
//                 return loggedOutRoute;
//               },
//             ),
//             routeInformationParser: const RoutemasterParser(),
//           ),
//           error: (error, stackTrace) => ErrorText(error: error.toString()),
//           loading: () => const Loader(),
//         );
//   }
// }
