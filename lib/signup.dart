// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectwrk/firstpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectwrk/ui/login.dart';
import 'package:projectwrk/ui/student.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignUp extends StatefulWidget {
  final bool obsecureText;
  final String hintText;

  SignUp({super.key, required this.obsecureText, required this.hintText});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   late final TextEditingController _email;

   late final TextEditingController _password;

 @override
 void initState(){
  _email = TextEditingController();
  _password = TextEditingController();
  super.initState();
 }

 void dispose(){
  _email.dispose();
  _password.dispose();
  super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: FutureBuilder(
        future: Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.none:
            break;
            case ConnectionState.waiting:
            break;
            case ConnectionState.active:
            break;
            case ConnectionState.done:break;
          }
          return   
          Column(
            children: [
              const Text(
            "Sign Up ",
            selectionColor: Colors.lightBlue,
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                color: Colors.lightBlue),
          ),
          const Text(" "),
          const Text(" "),
          const Text(" "),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent)),
                    fillColor: Colors.white,
                    filled: true,
                    icon: Icon(Icons.mail, color: Colors.blueGrey),
                    labelText: "Enter email address",
                    hintText: "Email Address",
                    border: OutlineInputBorder()),
                obscureText: false, keyboardType: TextInputType.emailAddress,
                enableSuggestions: true,
                controller: _email,
              )),
          const Text(" "),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
              
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    fillColor: Colors.white,
                    filled: true,
                    icon: Icon(
                      Icons.key,
                      color: Colors.lightBlue,
                    ),
                    labelText: "Enter password",
                    hintText: "Password",
                    border: OutlineInputBorder()),
                obscureText: true,
                controller: _password,
              )),
          const Text(" "),
         ElevatedButton(
  onPressed: (_email.text.isNotEmpty && _password.text.isNotEmpty) ? () async {
    final email = _email.text;
    final password = _password.text;

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please provide both email and password",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
      );
    } else {
      try {
        final UserCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // If sign up is successful, you can navigate to the next page or show a success message.
        Navigator.of(context).pushNamedAndRemoveUntil( '/Firstpage/', (route) => false);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(
            msg: "Weak Password",
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
          );
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
            msg: "Email already exists",
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
          );
        } else if (e.code == 'invalid-email') {
          Fluttertoast.showToast(
            msg: "Invalid Email",
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
          );
        } else {
          // Handle other FirebaseAuthException codes
        }
      }
    }
  } : null, // Set onPressed to null when either email or password is empty
  child: Text('Sign Up'),
),

       //       child: const Text("Sign Up")),
          TextButton(onPressed: () {
             Navigator.push(context,
                   MaterialPageRoute(builder: (context) =>  Login(obsecureText: true, hintText: '',)));
          }, child: const Text("Already Have an Account"))
        
        ]
            
          );     
          // ignore: dead_code
           return const Text("Loading....");
        },
    ));
  }
}
