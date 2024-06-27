import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
import 'package:word_game/features/auth/login/presentation/login.dart';
import 'package:word_game/features/home/presentation/home.dart';
import 'package:word_game/widgets/custom_snackbar.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _firebaseUser;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(auth.currentUser);
    _firebaseUser.bindStream(auth.authStateChanges());
    ever(_firebaseUser, initialScreen);
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  // Sign up method
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user data in Realtime Database
      await _database
          .child('users/${userCredential.user?.uid}')
          .set({'Email': email, "Name": email.split('@')[0]});

      return userCredential.user;
    } catch (e) {
      CustomSnackbar.showError('Error signing up: $e');
      return null;
    }
  }

  // Sign in method
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      CustomSnackbar.showError('Error signing up: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      var snapshot = await _database.child('users').child(uid).once();
      return snapshot as Map<String, dynamic>?;
    } catch (e) {
      CustomSnackbar.showError('Error signing up: $e');
      return null;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      CustomSnackbar.showError('Error signing up: $e');
    }
  }
}
