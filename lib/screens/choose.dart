import 'package:crud_pet_app/screens/create.dart';
import 'package:crud_pet_app/screens/del.dart';
import 'package:crud_pet_app/screens/login.dart';
import 'package:crud_pet_app/screens/read.dart';
import 'package:crud_pet_app/screens/update.dart';
import 'package:crud_pet_app/screens/view.dart';
import 'package:flutter/material.dart';

class choose extends StatefulWidget {
  const choose({Key? key}) : super(key: key);

  @override
  State<choose> createState() => _chooseState();
}

class _chooseState extends State<choose> {
  int _selectedPage = 0;
  _onTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            _children[_selectedPage])); // this has changed
  }

  final List<Widget> _children = [HomePage(), viewPage()];

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_rounded, size: 30),
            ),
            BottomNavigationBarItem(
                label: 'List', icon: Icon(Icons.list, size: 30))
          ],
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
            _onTap();
          },
        ),
      ),
    );
  }

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
                  builder: (context) => LoginScreen(),
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
      body: Stack(children: [
        Container(
          color: Color.fromARGB(255, 236, 218, 196),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose an operation',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(), //Here home page is create.dart
                              ));
                        },
                        child: const Text('Create',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    readPage(), //Here home page is create.dart
                              ));
                        },
                        child: const Text('Read',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 55, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    update(), //Here home page is create.dart
                              ));
                        },
                        child: const Text('Update',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 46, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    deletePage(), //Here home page is create.dart
                              ));
                        },
                        child: const Text('Delete',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              )),
        )
      ]),
      //bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
