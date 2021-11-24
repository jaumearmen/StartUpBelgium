import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Una variable con barra baja significa private

  Future signinWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = _auth.createUserWithEmailAndPassword(
          email: email, password: password) as UserCredential;
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

Future<bool> signIn(String email, String password) async {
  try {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> signUp(
    String email, String password, String name, String surname) async {
  try {
    bool createdUser = await createUser(email, password);
    if (createdUser) {
      bool savedNames = await saveNames(name, surname);
      if (savedNames) return true;
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> createUser(String email, String password) async {
  try {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak');
    } else if (e.code == 'email-already-in-use.') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> saveNames(String name, String surname) async {
  try {
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
