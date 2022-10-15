import 'dart:io';

import 'package:io/io.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Provider/profile_image_provider.dart';
import '../../../Controller/Provider/user_provider.dart';
import '../../../Model/model.dart';
import '../studentListScreem/stundentListScreen.dart';

class MyHomePage extends StatelessWidget {
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController JobController = TextEditingController();
  TextEditingController PlaceController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController PincodeController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  dynamic imagepath;

  @override
  Widget build(BuildContext context) {
    imagepath = Provider.of<ProfileImageProvider>(context).image;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Application",
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(StudentListScreen.routeName);
              },
              icon: const Icon(Icons.list))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              child: InkWell(
                onTap: () async {
                  XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image == null) {
                    imagepath == null;
                  } else {
                    imagepath = Provider.of<ProfileImageProvider>(context,
                            listen: false)
                        .changeImage(image: image.path);
                  }
                },
                child: Center(
                  child: imagepath == null
                      ? CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 70,
                          child: ClipRRect(
                              child: Lottie.network(
                            'https://assets3.lottiefiles.com/packages/lf20_gsiJ2w.json',
                            fit: BoxFit.cover,
                          )),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(imagepath!)),
                          radius: 70,
                        ),
                ),
              ),
            ),
            const Divider(
              color: Colors.indigo,
              height: 20.0,
              thickness: 1.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: NameController,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Your Name"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: AgeController,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Your Age"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: PlaceController,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Your Place"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: JobController,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Your Jobe"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: PhoneController,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Your Phone Number"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 25,
              controller: AddressController,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Your Address"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: PincodeController,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Your Pin Code"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                width: double.infinity,
                height: 60,
                child: RawMaterialButton(
                  onPressed: () async {
                    _onAddUserButton(context);
                    NameController.clear();
                    AgeController.clear();
                    JobController.clear();
                    PlaceController.clear();
                    AddressController.clear();
                    PhoneController.clear();
                    PincodeController.clear();
                    imagepath = Provider.of<ProfileImageProvider>(context,
                            listen: false)
                        .changeImage(image: null);
                  },
                  fillColor: Colors.blueGrey,
                  child: const Text(
                    "Submit",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> _onAddUserButton(BuildContext context) async {
    final _name = NameController.text.trim();
    final _age = AgeController.text.trim();
    final _job = JobController.text.trim();
    final _place = PlaceController.text.trim();
    final _address = AddressController.text.trim();
    final _phone = PhoneController.text.trim();
    final _pincode = PincodeController.text.trim();
    final _image = imagepath;
    if (_name.isEmpty ||
        _age.isEmpty ||
        _job.isEmpty ||
        _place.isEmpty ||
        _image == null ||
        _address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('All Field is required'),
        duration: Duration(milliseconds: 300),
      ));
    } else {
      final _user = DataBase(
          name: _name,
          age: _age,
          job: _job,
          place: _place,
          image: imagepath!,
          address: _address,
          phone: _phone,
          pincode: _pincode);
      Provider.of<UserProvider>(context, listen: false).addUser(_user);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Form submitted'),
        duration: Duration(milliseconds: 300),
      ));
      NameController.clear();
    }
  }
}
