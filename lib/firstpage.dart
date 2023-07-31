// ignore_for_file: unnecessary_import, unused_import, unnecessary_new


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectwrk/ui/lecturer.dart';
import 'package:projectwrk/ui/student.dart';

import 'firebase_options.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  void initState() {
    
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          shadowColor: Colors.blueAccent,
          title: const Text(
            "Linkup",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 23,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          )),
      body: new Column(children: [
        Center(
            child: new Column(children: [
          const Text(
            "Click here if you are ",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const ColoredBox(
            color: Colors.transparent,
            child: Text(""),
          ),
          ListTile(
              visualDensity:
                  const VisualDensity(horizontal: 3.3, vertical: 3.3),
              dense: true,
              subtitle: TextButton(
                  onPressed: ()  {
                    Navigator.of(context).pushNamed('/lecturer/', );
                  },
                  child: const Text(
                    "A Lecturer",
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 35),
                  )),
              title: const Icon(
                Icons.person,
                size: 100,
                fill: .015,
              ))
        ])),
        ListTile(
            visualDensity: const VisualDensity(horizontal: 3.3, vertical: 3.3),
            dense: true,
            subtitle: TextButton(
                onPressed: ()  {
                Navigator.of(context).pushNamed('/Student/', );
                },
                child: const Text(
                  " A Student",
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 35),
                )),
            title: const Icon(
              Icons.person,
              size: 100,
              fill: .015,
            ))
      ]),
    );
  }
    
}




