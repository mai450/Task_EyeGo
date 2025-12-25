import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptaions.dart';

class FirebaseServices {
  Future isLoggedIn() async {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExecption(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExecption(
            message: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw CustomExecption(
            message: 'The email address is badly formatted. invalid-email');
      } else {
        throw CustomExecption(
            message: 'Something went wrong. please try again later.');
      }
    } catch (e) {
      throw CustomExecption(message: 'Failed to create user. $e');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String input,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: input,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomExecption(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomExecption(
            message: 'Wrong password or Email provided for that user.');
      } else if (e.code == 'invalid-credential') {
        throw CustomExecption(
          message: 'Invalid email or password.',
        );
      } else {
        throw CustomExecption(
            message: 'Something went wrong. please try again later.');
      }
    } catch (e) {
      throw CustomExecption(
          message: 'Something went wrong. please try again later.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw CustomExecption(
          message: 'Something went wrong. please try again later.');
    }
  }
}
