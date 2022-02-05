import 'package:bhive_project/constats.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InitialScreen());
  
}
// ignore: use_key_in_widget_constructors
class InitialScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(),
    title:appName,
    debugShowCheckedModeBanner: false,

    );
  }
}