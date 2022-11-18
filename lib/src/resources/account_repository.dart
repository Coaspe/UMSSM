import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ssm/src/models/user.dart';
import 'package:ssm/src/util/firebase.dart';

class AccountRepository {
  AccountRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  Stream<Future<SUser>?> get firebaseUser {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      Future<SUser>? user;
      if (firebaseUser != null) {
        user = FireStoreMethods.getUserByEmailWithSignup(
          firebaseUser.email!,
          firebaseUser.displayName!,
          firebaseUser.uid,
        );
      }
      return user;
    });
  }

  Future<void> logInWithGoogle() async {
    try {
      late final AuthCredential credential;
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final userInfo = (await _firebaseAuth.signInWithCredential(credential))
          .additionalUserInfo;

      final email = userInfo?.profile?['email'];
      final name = userInfo?.profile?['name'];
      final uid = userInfo?.profile?['uid'];

      if (email != null && name != null && uid != null) {
        await FireStoreMethods.getUserByEmailWithSignup(email, name, uid);
      }
    } on PlatformException catch (e) {
      print(e.message);
    } on FirebaseAuthException catch (e) {
      print(e);
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (e) {
      print(e);
      throw LogInWithGoogleFailure();
    }
  }
}

class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      case 'unknown':
        {
          return const LogInWithGoogleFailure('Email or Username is unknown.');
        }
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}
