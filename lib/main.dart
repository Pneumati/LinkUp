// ignore_for_file: unused_import

import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectwrk/firstpage.dart';
import 'package:projectwrk/main.dart';
import 'package:projectwrk/signup.dart';
import 'package:projectwrk/lecturer.dart';
import 'package:projectwrk/ui/lecturer.dart';
import 'package:projectwrk/ui/login.dart';
import 'package:projectwrk/ui/student.dart';
import 'package:projectwrk/bookappointmnet.dart';
import 'package:projectwrk/help.dart';
import 'package:projectwrk/viewaptstu.dart';
import 'package:projectwrk/bookappsu.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "link up ",
    home: Homepage(
     // obsecureText: true,
     // hintText: '',
    ),
    routes:{
      '/Firstpage/' :(context) => const Firstpage(),
      '/Login/':(context) =>  Login(obsecureText: true, hintText: ''),
      '/lecturer/': (context) => const Lecturer(),
      '/Signup/':(context) => SignUp(obsecureText: true, hintText: ''),
      '/Student/': (context) => const Studentfirstpage(),
      '/bookappointment/':(contect) => const Bookappointment()
  } ,
    debugShowCheckedModeBanner: false,
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  Future<void> checkUserAuthentication() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is logged in, navigate to the next page
       Navigator.of(context as BuildContext).pushNamedAndRemoveUntil( '/Firstpage/', (route) => false);
      
    } else {
      // User is not logged in, show the login screen
      Navigator.of(context as BuildContext).pushNamedAndRemoveUntil( '/Login/', (route) => false);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Center(
        child: CircularProgressIndicator(), // You can show a loading indicator while checking authentication
      ),
    );
  }
}







  
  class VerifyEmail extends StatefulWidget{
  const VerifyEmail({super.key});

  @override
  
  _VerifyEmailState createState() => _VerifyEmailState(); 
  }

  class _VerifyEmailState extends State<VerifyEmail>{
  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Padding(padding: EdgeInsets.all(50)),
        Text("Verify Email Address"),
        
        TextButton(onPressed: () async{
          final User = FirebaseAuth.instance.currentUser;
         await User?.sendEmailVerification();
         Fluttertoast.showToast(msg: 'Email Verification link has been sent. Check email',
         gravity: ToastGravity.CENTER,
         backgroundColor: Colors.blue);
        }, child: const Text("Send email Verification"))
      ],
    );
  }
  }