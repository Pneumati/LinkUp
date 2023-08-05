// ignore_for_file: unused_import, avoid_unnecessary_containers

// ignore: avoid_web_libraries_in_flutter


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectwrk/bookappointmnet.dart';
import 'package:projectwrk/firstpage.dart';
import 'package:projectwrk/help.dart';
import 'package:projectwrk/ui/login.dart';

class Lecturer extends StatelessWidget {
  const Lecturer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: "Go home",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Firstpage()));
          },
          child: const Icon(Icons.home),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            children: [
              Container(
                child: Column(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 100,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Booklec()));
                        },
                        child: const Text("Set An Appointment")),
                    const Text(" "),
                    const Text(" "),
                    /*const Text("  Description"
                        " :Helps you create time in order to help students know when you are   free and through this you can set the maximum number of student that"
                        "  you can meet in a given day when you are not free   you can put UNAVAILABLE in the given day ")*/
                    Container(
                        child: Column(children: [
                      const Icon(
                        Icons.person,
                        size: 100,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Viewappointmentlecture()));
                          },
                          child: const Text("View Appointment")),
                      /*const Text("  Description:"
                          " Helps you view appointment of student into your appoint time letting you know their name and course"),*/
                    ]))
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "Lecturer",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20),
          ),
        ),
        drawer: Drawer(
            child: ListView(children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blue,
              ),
              child: Text('Drawer Header')),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Firstpage()));
            },
            leading: const Icon(Icons.home),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {},
            leading: const Icon(Icons.settings),
          ),
          ListTile(
              title: const Text('Help'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Helpclass()));
              },
              leading: const Icon(Icons.help)),
          ButtonBar(
            children: [
              TextButton(onPressed: ()async {
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login(obsecureText: true, hintText: '')));           }
              }, child: const Text("LOG OUT"))
            ],
          )
        ])));
  }
}

Future<bool> showLogOutDialog(BuildContext context){
 return showDialog<bool>(context: context, 
  builder: (context) {
    return AlertDialog(
      title: const Text("Log Out"),
      content: const Text("Are you sure you want to logout"),
      actions: [
        TextButton(onPressed: (){
           Navigator.of(context).pushNamedAndRemoveUntil( '/Login/', (route) => false);
        }, child: Text("Yes")),
        TextButton(onPressed: (){
        Navigator.of(context).pop(false);
        }, child: Text("No"))
      ],
    );
  }
  ).then((value) => value ?? false);
}