import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/services/auth/auth_gate.dart';
//import 'package:flutter/gestures.dart';
//import 'dart:ui';
//import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
// import 'package:myapp/page-1/updatedpage1.dart';
// import 'package:myapp/page-1/updatedpage2.dart';
// import 'package:myapp/page-1/homepage.dart';
// import 'package:myapp/page-1/settings.dart';
// import 'package:myapp/page-1/account.dart';
// import 'package:myapp/page-1/setgoal-3.dart';
// import 'package:myapp/page-1/setgoal-8.dart';
// import 'package:myapp/page-1/setgoal-4.dart';
// import 'package:myapp/page-1/setgoal-5.dart';
// import 'package:myapp/page-1/setgoal-6.dart';
//import 'package:myapp/page-1/dashboard-2.dart';
//import 'package:myapp/page-1/dashboard-3.dart';
//import 'package:myapp/page-1/dashboard-5.dart';
//import 'package:myapp/page-1/dashboard-4.dart';
// import 'package:myapp/page-1/android-large-3.dart';
// import 'package:myapp/page-1/goal-svgrepo-com-1.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart'; 

void main() async{ 
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: const AuthGate()
	);
	}
}
