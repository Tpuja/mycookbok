import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_cook_book/screenUI/Recipes.dart';
import 'package:my_cook_book/screenUI/home.dart';
import 'package:my_cook_book/screenUI/login.dart';
import 'package:my_cook_book/screenUI/manage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cook Book',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home:  login(),
      
    );
  }
}