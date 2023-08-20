import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class body3 extends StatefulWidget {
  const body3({Key? key}) : super(key: key);

  @override
  State<body3> createState() => _body3State();
}

class _body3State extends State<body3> {
  final Stream<QuerySnapshot> productsStream =
      FirebaseFirestore.instance.collection('products2').snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int itemindex;
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
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  // big stack
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            itemindex = index;
                            data = data[index];

                            return Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              height: 250,
                              // stack 2
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Description(
                                  //       product: products[index],
                                  //       index: index,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 15),
                                                blurRadius: 25,
                                                color: Colors.black12)
                                          ]),
                                    ),
                                    // image
                                    Positioned(
                                        top: 0.0,
                                        left: 0.0,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 160,
                                          width: 200,
                                          child: Image.asset(
                                            data['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        )),

                                    Positioned(
                                        bottom: 0.0,
                                        right: 0.0,
                                        top: 10.0,
                                        child: SizedBox(
                                          height: 136,
                                          width: size.width - 200,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              // title
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Text(
                                                  data['title'],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //subtitle
                                              Text(
                                                data['subtitle'],
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              // price
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 30,
                                                      vertical: 5,
                                                    ),
                                                    child: Text(
                                                      'price :${data['price']}\$',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
