import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/dashboard.dart';
import 'package:myapp/page-1/homepage-1.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap Scaffold with SingleChildScrollView
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            //if user is logged in
            if(snapshot.hasData)
            {
              return const dashboard();
            }
            else
            {
              return const homepage();
            }
          },
        ),
      ),
    );
  }
}