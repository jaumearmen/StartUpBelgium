import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
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

Future<bool> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> deleteAccount() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.delete();
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> createUser(String email, String password) async {
  try {
    await FirebaseAuth.instance
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
