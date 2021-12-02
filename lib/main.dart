import 'package:flutter/material.dart';
import 'package:flutter_app/register.dart';
import 'constant.dart';
import 'LoginScreen.dart';
import 'dashboard.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(Initial_screen());
}

class Initial_screen extends StatelessWidget {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  @override
  Widget build(BuildContext context) {
    final email = storage.getItem('emailAddress'); 
    print("email $email");
    return MaterialApp(
      home: email != null ? Dashboard() : RegisterScreen(), // Dashboard()
      title: app_name,
      debugShowCheckedModeBanner: false,
    );
  }
}
