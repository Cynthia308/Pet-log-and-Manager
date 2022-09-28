import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_pet_app/screens/choose.dart';
import 'package:crud_pet_app/screens/create.dart';
import 'package:flutter/material.dart';

class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  getPetName(name) {
    petName = name;
  }

  getPetType(type) {
    petType = type;
  }

  getPetBreed(breed) {
    petBreed = breed;
  }

  getPetAge(age) {
    petAge = double.parse(age);
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyPets").doc(petName);

    Map<String, dynamic>? pets = {
      "petName": petName,
      "petType": petType,
      "petBreed": petBreed,
      "petAge": petAge,
    };

    documentReference.set(pets).whenComplete(() {
      print("$petName updated");
    });
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
      body: Stack(children: [
        Container(
            color: Color.fromARGB(255, 236, 218, 196),
            height: double.infinity,
            width: double.infinity,

            /*decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.redAccent,
                Color.fromARGB(255, 221, 88, 88),
                Color.fromARGB(204, 255, 138, 102),
                Color.fromARGB(153, 221, 134, 100),
              ])),*/
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Make an Update',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Pet Name",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.redAccent, width: 2.0),
                        ),
                      ),
                      onChanged: (String name) {
                        getPetName(name);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Pet Type",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0))),
                      onChanged: (String type) {
                        getPetType(type);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Pet Breed",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0))),
                      onChanged: (String breed) {
                        getPetBreed(breed);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Pet Age",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0))),
                      onChanged: (String age) {
                        getPetAge(age);
                      },
                    ),
                    /*reusableTextField(
                        'Pet Name', Icons.pets, false, _petNameTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField('Pet Type', Icons.animation_outlined,
                        false, _petTypeTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        'Pet Breed', Icons.merge, false, _petAgeTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField('Pet Age', Icons.date_range, false,
                        _petAgeTextController),*/
                    SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        updateData();
                      },
                      child: const Text('Update',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ))),
        //child: reusableTextField('Pet Name', Icons.pets, false, _petNameTextController))
      ]),
    );
  }
}
