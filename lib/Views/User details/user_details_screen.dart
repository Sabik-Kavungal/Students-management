import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../Controller/Provider/user_provider.dart';

class StudentDetailsScreen extends StatelessWidget {
  int index;
  StudentDetailsScreen({Key? key, this.index = 0}) : super(key: key);
  static const routeName = '/student-details';

  @override
  Widget build(BuildContext context) {
    const kheight = SizedBox(
      height: 5,
    );
    const kheight30 = SizedBox(
      height: 15,
    );

    final student = Provider.of<UserProvider>(context).studentBox;
    final studentList = student.values.toList();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.blueGrey,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'STUDENT INFO',
            style: TextStyle(color: Colors.blueGrey),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView(
          children: [
            kheight,
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(studentList[index].image),
                  fit: BoxFit.cover,
                  height: 250,
                  width: 300,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kheight30,
                StudentDetails(
                    str: 'name   :'.toUpperCase(),
                    main: studentList[index].name.toUpperCase()),
                kheight30,
                StudentDetails(
                    str: 'age       :'.toUpperCase(),
                    main: studentList[index].age.toUpperCase()),
                kheight30,
                StudentDetails(
                    str: 'place  : '.toUpperCase(),
                    main: studentList[index].place.toUpperCase()),
                kheight30,
                StudentDetails(
                    str: 'job  :'.toUpperCase(),
                    main: studentList[index].job.toUpperCase()),
                kheight30,
                StudentDetails(
                    str: 'phone  :'.toUpperCase(),
                    main: studentList[index].phone.toUpperCase()),
                kheight30,
                StudentDetails(
                    str: 'address  :'.toUpperCase(),
                    main: studentList[index].address.toUpperCase()),
                kheight30,
                StudentDetails(
                    str: 'pincode  :'.toUpperCase(),
                    main: studentList[index].pincode.toUpperCase()),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class StudentDetails extends StatelessWidget {
  const StudentDetails({Key? key, required this.str, required this.main})
      : super(key: key);
  final String main;
  final String str;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 50,
        ),
        Text(
          str,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Expanded(
          child: Text(
            main,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
