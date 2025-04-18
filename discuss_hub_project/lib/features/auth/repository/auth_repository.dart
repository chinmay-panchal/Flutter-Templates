import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:discuss_hub_project/core/constants/constants.dart';
import 'package:discuss_hub_project/core/constants/firebase_constants.dart';
import 'package:discuss_hub_project/core/failure.dart';
import 'package:discuss_hub_project/core/providers/firebase_providers.dart';
import 'package:discuss_hub_project/core/type_defs.dart';
import 'package:discuss_hub_project/models/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle(bool isFromLogin) async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        await _googleSignIn.signOut(); // Clear any existing session

        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        if (googleUser == null) {
          return left(Failure('Google sign-in was cancelled'));
        }

        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        if (isFromLogin) {
          userCredential = await _auth.signInWithCredential(credential);
        } else {
          final currentUser = _auth.currentUser;
          if (currentUser == null) {
            return left(Failure('No current user to link credentials'));
          }
          userCredential = await currentUser.linkWithCredential(credential);
        }
      }

      if (userCredential.user == null) {
        return left(Failure('User credential is null'));
      }

      UserModel userModel;

      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        userModel = UserModel(
          name: userCredential.user!.displayName ?? 'No Name',
          profilePic:
              userCredential.user!.photoURL ?? Constants.avatarDefault,
          banner: Constants.bannerDefault,
          uid: userCredential.user!.uid,
          isAuthenticated: true,
          karma: 0,
          awards: [
            'awesomeAns',
            'gold',
            'platinum',
            'helpful',
            'plusone',
            'rocket',
            'thankyou',
            'til',
          ],
        );
        await _users.doc(userModel.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuth error: ${e.message}");
      return left(Failure(e.message ?? 'Unknown Firebase Auth error'));
    } on FirebaseException catch (e) {
      print("Firebase error: ${e.message}");
      return left(Failure(e.message ?? 'Unknown Firebase error'));
    } catch (e) {
      print("Unexpected error: $e");
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> signInAsGuest() async {
    try {
      var userCredential = await _auth.signInAnonymously();

      if (userCredential.user == null) {
        return left(Failure('Anonymous user creation failed'));
      }

      UserModel userModel = UserModel(
        name: 'Guest',
        profilePic: Constants.avatarDefault,
        banner: Constants.bannerDefault,
        uid: userCredential.user!.uid,
        isAuthenticated: false,
        karma: 0,
        awards: [],
      );

      await _users.doc(userModel.uid).set(userModel.toMap());

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      print("Anonymous sign-in error: ${e.message}");
      return left(Failure(e.message ?? 'Unknown Firebase Auth error'));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }

  void logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:discuss_hub_project/core/constants/constants.dart';
// import 'package:discuss_hub_project/core/constants/firebase_constants.dart';
// import 'package:discuss_hub_project/core/failure.dart';
// import 'package:discuss_hub_project/core/providers/firebase_providers.dart';
// import 'package:discuss_hub_project/core/type_defs.dart';
// import 'package:discuss_hub_project/models/user_model.dart';

// final authRepositoryProvider = Provider(
//   (ref) => AuthRepository(
//     firestore: ref.read(firestoreProvider),
//     auth: ref.read(authProvider),
//     googleSignIn: ref.read(googleSignInProvider),
//   ),
// );

// class AuthRepository {
//   final FirebaseFirestore _firestore;
//   final FirebaseAuth _auth;
//   final GoogleSignIn _googleSignIn;

//   AuthRepository({
//     required FirebaseFirestore firestore,
//     required FirebaseAuth auth,
//     required GoogleSignIn googleSignIn,
//   })  : _auth = auth,
//         _firestore = firestore,
//         _googleSignIn = googleSignIn;

//   CollectionReference get _users =>
//       _firestore.collection(FirebaseConstants.usersCollection);

//   Stream<User?> get authStateChange => _auth.authStateChanges();

//   FutureEither<UserModel> signInWithGoogle(bool isFromLogin) async {
//     try {
//       UserCredential userCredential;
//       if (kIsWeb) {
//         GoogleAuthProvider googleProvider = GoogleAuthProvider();
//         googleProvider
//             .addScope('https://www.googleapis.com/auth/contacts.readonly');
//         userCredential = await _auth.signInWithPopup(googleProvider);
//       } else {
//         final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//         final googleAuth = await googleUser?.authentication;

//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken,
//           idToken: googleAuth?.idToken,
//         );

//         if (isFromLogin) {
//           userCredential = await _auth.signInWithCredential(credential);
//         } else {
//           userCredential =
//               await _auth.currentUser!.linkWithCredential(credential);
//         }
//       }

//       UserModel userModel;

//       if (userCredential.additionalUserInfo!.isNewUser) {
//         userModel = UserModel(
//           name: userCredential.user!.displayName ?? 'No Name',
//           profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
//           banner: Constants.bannerDefault,
//           uid: userCredential.user!.uid,
//           isAuthenticated: true,
//           karma: 0,
//           awards: [
//             'awesomeAns',
//             'gold',
//             'platinum',
//             'helpful',
//             'plusone',
//             'rocket',
//             'thankyou',
//             'til',
//           ],
//         );
//         await _users.doc(userCredential.user!.uid).set(userModel.toMap());
//       } else {
//         userModel = await getUserData(userCredential.user!.uid).first;
//       }
//       return right(userModel);
//     } on FirebaseException catch (e) {
//       print("error1");
//       throw e.message!;
//     } catch (e) {
//       print("error2");
//       return left(Failure(e.toString()));
//     }
//   }

//   FutureEither<UserModel> signInAsGuest() async {
//     try {
//       var userCredential = await _auth.signInAnonymously();

//       UserModel userModel = UserModel(
//         name: 'Guest',
//         profilePic: Constants.avatarDefault,
//         banner: Constants.bannerDefault,
//         uid: userCredential.user!.uid,
//         isAuthenticated: false,
//         karma: 0,
//         awards: [],
//       );

//       await _users.doc(userCredential.user!.uid).set(userModel.toMap());

//       return right(userModel);
//     } on FirebaseException catch (e) {
//       throw e.message!;
//     } catch (e) {
//       return left(Failure(e.toString()));
//     }
//   }

//   Stream<UserModel> getUserData(String uid) {
//     return _users.doc(uid).snapshots().map(
//         (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
//   }

//   void logOut() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }
