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
