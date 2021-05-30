import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdds/page/home_page.dart';
import 'package:gdds/provider/g_signIn_provider.dart';
import 'package:provider/provider.dart';

class EmailLogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anos profile'),),
      body: Column(
        children: [
          Text('This is anos profile'),
          ElevatedButton(onPressed: () async{
          try {
            // User updateUser = FirebaseAuth.instance.currentUser!;
            await FirebaseAuth.instance.signOut().whenComplete(() => 
            Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => HomePage())));
    }         catch (e) {
              print(e);
    }

          }, child: Text('Logout')),
        ],
      ),
      
    );
  }
}
