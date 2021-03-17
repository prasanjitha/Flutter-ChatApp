
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class alldata extends StatefulWidget {
  @override
  _alldataState createState() => _alldataState();
}

class _alldataState extends State<alldata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All DAta'),
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
