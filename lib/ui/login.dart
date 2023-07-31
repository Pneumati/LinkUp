// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectwrk/firebase_options.dart';
import 'package:projectwrk/firstpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectwrk/signup.dart';
import 'firebase_options.dart';
import 'package:flutter/gestures.dart';


class Login extends StatefulWidget {
  final bool obsecureText;
  final String hintText;

  Login({super.key, required this.obsecureText, required this.hintText});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            return Center(
              child: const CircularProgressIndicator());
            case ConnectionState.active:
            break;
            case ConnectionState.done:break;
          }
          return   
          Column(
            children: [
              const Text(
            "Login",
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
              onPressed: () async {
               
                final email = _email.text;
                final password = _password.text;
               try{
                await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed('/Firstpage/',);
               } 
               on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                Fluttertoast.showToast(msg: "User not found",
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.blue);
              } 
              else if(e.code == 'wrong-password'){
                 Fluttertoast.showToast(msg: "Wrong Password",
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.blue);
              }
              else{
                Fluttertoast.showToast(msg: e.code,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.blue);
              }
              
               }
              },
              child: const Text("Login")),

  



         TextButton(onPressed: () {
             Navigator.of(context).pushNamed('/SignUp/', );
         }, child: const Text("Sign Up"))
        
        ]
            
          );     
          // ignore: dead_code
           return const Text("Loading....");
        },
    ));
  }
  
}
