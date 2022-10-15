import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/Model/model.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Provider/profile_image_provider.dart';
import '../../homeScreen/widgets/widgets.dart';



class EditStudentList extends StatelessWidget {
  var imagepath;
  int index;
  EditStudentList({
    required this.index,
    Key? key,
    required this.studentList,
    required this.kheight,
    required this.NameController,
    required this.AgeController,
    required this.JobController,
    required this.PlaceController,
    required this.AddressController,
    required this.PincodeController,
    required this.PhoneController,
  }) : super(key: key);

  final List<DataBase> studentList;
  final SizedBox kheight;
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController JobController = TextEditingController();
  TextEditingController PlaceController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController PincodeController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var nameStudent = studentList[index].name;
    imagepath = Provider.of<ProfileImageProvider>(context).image;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: imagepath == null
                    ? FileImage(
                        File(studentList[index].image),
                      )
                    : FileImage(
                        File(imagepath),
                      ),
              ),
            ],
          ),
          kheight,
          studentTextFeild('${studentList[index].name}', NameController),
          kheight,
          studentTextFeild('${studentList[index].age}', AgeController),
          kheight,
          studentTextFeild('${studentList[index].job}', JobController),
          kheight,
          studentTextFeild('${studentList[index].place}', PlaceController),
          kheight,
          studentTextFeild('${studentList[index].phone}', PhoneController),
          kheight,
          studentTextFeild('${studentList[index].address}', AddressController),
          kheight,
          studentTextFeild('${studentList[index].pincode}', PincodeController),
          kheight,
        ],
      ),
    );
  }
}
