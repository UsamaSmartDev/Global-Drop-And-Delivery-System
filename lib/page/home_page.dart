import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:gdds/Screens/register/google_signIn.dart';
import 'package:gdds/Screens/widget/email_login_widget.dart';
import 'package:gdds/Screens/widget/logged_in_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasError)
            return Center(
              child: Text('something went wrong'),
            );
          else if (snapshot.hasData) {
            return LoggedInWidget();
          } 
          else
            return GoogleSign();
        },
      ),
    );
  }
}
