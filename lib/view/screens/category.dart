import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _firestoreInstance=FirebaseFirestore.instance;
  List _products=[];
  fetchCategory()async{
    QuerySnapshot qn=await _firestoreInstance.collection("category").get();
    setState(() {
      for(int i =0;i<qn.docs.length;i++){
        _products.add(
            {
              "name": qn.docs[i]["name"],
              "image": qn.docs[i]["image"],



            }
        );
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Category',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 35,),
                Expanded(
                    child: GridView.builder(

                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
                        itemBuilder:(_,index)
                        {return GestureDetector(
                          onTap: (){},
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio:2,
                                    child: Container(
                                        color: Colors.blue,
                                        child:
                                        Image.network(_products[index]["image"][0],))),
                                const SizedBox(height: 7,),
                                Text("${_products[index]["name"]}"),


                              ],
                            ),

                          ),
                        );

                        }
                    )
                ),
              ],))
    );
  }
}
