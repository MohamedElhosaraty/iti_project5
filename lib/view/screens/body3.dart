import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class body3 extends StatefulWidget {
  const body3({Key? key}) : super(key: key);

  @override
  State<body3> createState() => _body3State();
}

class _body3State extends State<body3> {
  final Stream<QuerySnapshot> productsStream = FirebaseFirestore.instance.collection('products').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Column(
              children: [
                ListTile(
                  title: Text(data['name'],style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 30
                  ),),
                  subtitle: Text(data['price'],style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 30),
                  ),),SizedBox(
                  height: 20,
                )
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
