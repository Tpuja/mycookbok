import 'package:my_cook_book/screenUI/create_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cook_book/screenUI/home.dart';

import 'auth_service.dart';

void main() async {
  runApp(const login());
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://i.postimg.cc/zD6xwS28/backgroundimage123.png'),
        fit: BoxFit.cover,
      ),
    ),
      child: Column(
      children: [
          Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 80),
                child: Center(
                  child: Container(
                    child: ClipOval(
                      child: Image.network(
                          "https://i.postimg.cc/fRZcHSLB/finallogo.png",
                          fit: BoxFit.cover,
                          width: 215,
                          height: 205,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : Container(
                                      width: 200,
                                      height: 200,
                                    )),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _emailController,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: OutlinedButton(
                onPressed: () async {
                  final message = await AuthService().login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  if (message!.contains('Success')) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const home(),
                      ),
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(196, 250, 54, 0), fontWeight: FontWeight.bold),
                )),
          ),
          
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Text("Doesn't have account?"),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CreateAccount(),
                              ),
                            );
                          },
                          child: Text("SignUp")),
                    ),
                  )
                ],
              )),
        ],
      ),
    ),
    );
  }
}