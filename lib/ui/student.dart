// ignore_for_file: unnecessary_import, implementation_imports, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectwrk/firstpage.dart';
import 'package:projectwrk/help.dart';
import 'package:projectwrk/signup.dart';
import 'package:projectwrk/ui/bookapptstu.dart';
import 'package:projectwrk/viewaptstu.dart';

class Studentfirstpage extends StatelessWidget {
  const Studentfirstpage({super.key});

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
                                  builder: (context) => const Bookaptsu()));
                        },
                        child: const Text("Book Appointment")),
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
                                    builder: (context) => const Viewstuappt()));
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
            "Student",
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Helpclass(),
                    ));
              },
              leading: const Icon(Icons.help)),
          ButtonBar(
            children: [
              TextButton(onPressed: () {}, child: const Text("LOG OUT"))
            ],
          )
        ])));
  }
}

class Bookappointment extends StatelessWidget {
  const Bookappointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text("Book Appointment"),
            Text(" "),
          ],
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          children: [
            Container(
              margin: const EdgeInsets.all(4),
            ),
            Container(margin: const EdgeInsets.all(4)),
            Container(margin: const EdgeInsets.all(4))
          ],
        ),
      ),
    );
  }
}
