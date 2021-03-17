import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'alldata.dart';
import 'displaydata2.dart';

class sendData extends StatelessWidget {
  TextEditingController sample1 = new TextEditingController();
  TextEditingController sample2 = new TextEditingController();
  TextEditingController sample3 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("send data"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: sample1,
                decoration: InputDecoration(hintText: 'sample01'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: sample2,
                decoration: InputDecoration(hintText: 'sample02'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: sample3,
                decoration: InputDecoration(hintText: 'sample03'),
              ),
              FlatButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "field1": sample1.text,
                    "field2": sample2.text,
                    "name": sample3.text
                  };
                  Firestore.instance.collection("test").add(data);
                },
                child: Text('submit'),
                color: Colors.blueAccent,
              ),
              FlatButton(
                onPressed: () async {
                  DocumentSnapshot variable = await Firestore.instance
                      .collection("test")
                      .document('Jp7frw2VGnGh27SAhUm0')
                      .get();
                  print(variable['field1']);
                },
                child: Text('getData'),
                color: Colors.blueAccent,
              ),
              FlatButton(
                onPressed: () async {
                 Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>alldata()));
                },
                child: Text('getAllData'),
                color: Colors.blueAccent,
              ),
              FlatButton(
                onPressed: () async {
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>displaydata()));
                },
                child: Text('getName'),
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
