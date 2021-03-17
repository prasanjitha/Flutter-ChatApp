
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class displaydata extends StatefulWidget {
  @override
  _displaydata createState() => _displaydata();
}

class _displaydata extends State<displaydata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('displaya data'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('test').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Text("no value");
          }
          return ListView(
            children: snapshot.data.documents.map((document){
              return Text(document['field1']);
            }).toList(),
          );
        },
      ),
    );
  }
}
