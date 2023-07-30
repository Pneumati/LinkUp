import 'package:flutter/material.dart';

class Helpclass extends StatelessWidget {
  const Helpclass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help "),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
          /*
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,*/
          children: const [
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(2)),
            )
          ]),
    );
  }
}
