import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdds/Screens/register/google_signIn.dart';
import 'package:gdds/provider/g_signIn_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.displayName! + "'s profile"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
        actions: [
          TextButton(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.lightBlue[700], fontSize: 15.0),
            ),
          ),
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Profile',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: 22),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(height: 8),
              Text(
                'Name: ' + user.displayName!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Email: ' + user.email!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}

