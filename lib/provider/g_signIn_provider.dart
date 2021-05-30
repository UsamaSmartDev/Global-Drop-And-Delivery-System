
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdds/Screens/register/google_signIn.dart';
import 'package:gdds/Screens/widget/logged_in_widget.dart';
import 'package:gdds/page/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
final googleSignIn = GoogleSignIn();

GoogleSignInAccount? _user;

GoogleSignInAccount get user => _user!;


Future googleLogin() async {
 try {
   final googleUser = await googleSignIn.signIn();
   
   if (googleUser == null) return;
   _user = googleUser;
   
   
   final googleAuth = await googleUser.authentication;
   
   final credential = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken
   );
   await FirebaseAuth.instance.signInWithCredential(credential);
 } catch (e) {
   print(e.toString());
 }

 notifyListeners();
}
  
  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future<String> createWithEmail(String email, String password) async
  {
    String exception = "";
    try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
          // User firebaseUser = result.user!;
          // User updateUser = FirebaseAuth.instance.currentUser!;
          // updateUser.updateProfile(displayName: _userNameData);
                      
            } catch (e) {
            print(e);
            exception = e.toString();
   }    
   return exception;
  }

}

