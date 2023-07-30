import 'package:flutter/material.dart';

class Booklec extends StatelessWidget {
  const Booklec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text("Book Appointment"),
          ],
        ),
      ),
      body: Column(children: [
        Text("Schedule Appointment"),
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
                    labelText: "Please Enter your Name",
                    hintText: "Name",
                    border: OutlineInputBorder()),
                
                
              )),
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
                    labelText: "Enter Department",
                    hintText: "Departmrent",
                    border: OutlineInputBorder()),
               
              )),
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
                    labelText: "Enter Date",
                    hintText: "Date",
                    border: OutlineInputBorder()),
      )),
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
                    labelText: "Enter Date",
                    hintText: "Date",
                    border: OutlineInputBorder()),
      )),
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
                    labelText: "Enter Date",
                    hintText: "Date",
                    border: OutlineInputBorder()),
      )),
      ],)
            
          
        );
      
    
  }
}

class Viewappointmentlecture extends StatelessWidget {
  const Viewappointmentlecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Appointement "),
      ),
    );
  }
}
