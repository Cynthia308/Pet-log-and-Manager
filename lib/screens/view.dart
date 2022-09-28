import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_pet_app/screens/choose.dart';
import 'package:crud_pet_app/widgets/listwidget.dart';
import 'package:flutter/material.dart';

class viewPage extends StatefulWidget {
  const viewPage({Key? key}) : super(key: key);

  @override
  State<viewPage> createState() => _viewPageState();
}

class _viewPageState extends State<viewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => choose(),
                ));
          },
        ),
        title: Row(
          children: [
            SizedBox(
              width: 82,
            ),
            Text(
              "Pet Log",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 0.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: ListViewWidget(),
      /*Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Expanded(
                  child: Text("Pet Name"),
                ),
                Expanded(
                  child: Text("Pet Type"),
                ),
                Expanded(
                  child: Text("Pet Breed"),
                ),
                Expanded(
                  child: Text("Pet Age"),
                )
              ],
            ),
          ),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("MyStudents").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          (snapshot.data! as QuerySnapshot).docs[index];
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(documentSnapshot["petName"]),
                          ),
                          Expanded(
                            child: Text(documentSnapshot["petType"]),
                          ),
                          Expanded(
                            child: Text(documentSnapshot["petBreed"]),
                          ),
                          Expanded(
                            child: Text(documentSnapshot["petAge"].toString()),
                          )
                        ],
                      );
                    });
              } else {
                return Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),*/
    );
  }
}
