import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  Data({this.app});
  final FirebaseApp? app;

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data>
{
  final referenceDB = FirebaseDatabase.instance.ref('buses');

  Widget listItem({required Map bus})
  {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.pink,
      height: 100,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bus['route'],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            " - ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            bus['person_count'],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 40
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "/",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            bus['capacity'],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 40
            ),
            textAlign: TextAlign.center,
          ),
        ],
       ),
         Text(
           bus['location'],
           style: const TextStyle(
             color: Colors.white,
             fontSize: 20,
           ),
           textAlign: TextAlign.center,
         ),
       ]
      ),
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Free Bus'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
            query: referenceDB,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index)
            {
              print(snapshot.value);
              Map bus = snapshot.value as Map;
              bus['key'] =  snapshot.key;
              return listItem(bus: bus);
            }
        ),
      ),
    );
  }
}
