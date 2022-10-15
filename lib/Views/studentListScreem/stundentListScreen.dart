import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/Views/studentListScreem/widgets/edit_user_widget.dart';

import 'package:provider/provider.dart';

import 'package:lottie/lottie.dart';

import '../../Controller/Provider/profile_image_provider.dart';
import '../../Controller/Provider/user_provider.dart';
import '../../Model/model.dart';
import '../Search/search_screen.dart';
import '../User details/user_details_screen.dart';

class StudentListScreen extends StatelessWidget {
  StudentListScreen({Key? key}) : super(key: key);
//  List<StudentDB> studentresult=studentProvider().student.values.toList();
// final studentList = Hive.box<StudentDB>('student').values.toList();

  final ImagePicker _picker = ImagePicker();
  var imagepath;
  static const routeName = '/student-list';
  @override
  Widget build(BuildContext context) {
    TextEditingController NameController = TextEditingController();
    TextEditingController AgeController = TextEditingController();
    TextEditingController JobController = TextEditingController();
    TextEditingController PlaceController = TextEditingController();
    TextEditingController AddressController = TextEditingController();
    TextEditingController PincodeController = TextEditingController();
    TextEditingController PhoneController = TextEditingController();
    imagepath = Provider.of<ProfileImageProvider>(context).image;
    final student = Provider.of<UserProvider>(context).studentBox;
    final studentList = student.values.toList();
    const kheight = SizedBox(
      height: 10,
    );
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.white,
        ],
      )),
      child: Scaffold(
          //backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Student List',
              style: TextStyle(color: Colors.blueGrey),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(studentList));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blueGrey,
                  ))
            ],
          ),
          body: studentList.isEmpty
              ? Center(
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_oga1x3jk.json'),
                )
              : ListView.separated(
                  itemCount: studentList.length,
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 2.5,
                      )),
                  itemBuilder: (context, index) {
                    final student =
                        Provider.of<UserProvider>(context).studentBox;
                    final studentList = student.values.toList();

                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(15)),
                        height: 90,
                        width: double.infinity,
                        child: Center(
                          child: ListTile(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => StudentDetailsScreen(
                                  index: index,
                                ),
                              ),
                            ),
                            leading: CircleAvatar(
                                radius: 35,
                                backgroundImage: FileImage(
                                  File(studentList[index].image),
                                )),
                            title: Text(
                              '${studentList[index].name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 19),
                            ),
                            subtitle: Text(
                              '${studentList[index].age}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Center(
                                              child: Text(
                                                'Update information'
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            content: EditStudentList(
                                              studentList: studentList,
                                              kheight: kheight,
                                              NameController: NameController =
                                                  TextEditingController(
                                                      text: studentList[index]
                                                          .name),
                                              AgeController: AgeController =
                                                  TextEditingController(
                                                      text: studentList[index]
                                                          .age),
                                              JobController: JobController =
                                                  TextEditingController(
                                                      text: studentList[index]
                                                          .job),
                                              PlaceController: PlaceController =
                                                  TextEditingController(
                                                      text: studentList[index]
                                                          .place),
                                              PhoneController: PhoneController =
                                                  TextEditingController(
                                                      text: studentList[index]
                                                          .phone),
                                              AddressController:
                                                  AddressController =
                                                      TextEditingController(
                                                          text:
                                                              studentList[index]
                                                                  .address),
                                              PincodeController:
                                                  PincodeController =
                                                      TextEditingController(
                                                          text:
                                                              studentList[index]
                                                                  .pincode),
                                              index: index,
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton.icon(
                                                      onPressed: () async {
                                                        XFile? image =
                                                            await _picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                        if (image == null) {
                                                          return;
                                                        } else {
                                                          imagepath = Provider
                                                                  .of<ProfileImageProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                              .changeImage(
                                                                  image: image
                                                                      .path);
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.photo),
                                                      label: const Text('')),
                                                  ElevatedButton.icon(
                                                      onPressed: () async {
                                                        XFile? image =
                                                            await _picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                        if (image == null) {
                                                          imagepath =
                                                              'https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_account_circle_48px-512.png';
                                                        } else {
                                                          imagepath = Provider
                                                                  .of<ProfileImageProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                              .changeImage(
                                                                  image: image
                                                                      .path);
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.camera),
                                                      label: const Text('')),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        final _name =
                                                            NameController.text
                                                                .trim();
                                                        final _age =
                                                            AgeController.text
                                                                .trim();
                                                        final _jobe =
                                                            JobController.text
                                                                .trim();
                                                        final _place =
                                                            PlaceController.text
                                                                .trim();
                                                        final _phone =
                                                            PhoneController.text
                                                                .trim();
                                                        final _address =
                                                            AddressController
                                                                .text
                                                                .trim();
                                                        final _pincode =
                                                            PincodeController
                                                                .text
                                                                .trim();
                                                        final _image =
                                                            imagepath;
                                                        if (_name.isEmpty ||
                                                            _age.isEmpty ||
                                                            _jobe.isEmpty ||
                                                            _place.isEmpty) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                            backgroundColor:
                                                                Colors.red,
                                                            content: Text(
                                                                'All Field is required'),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                          ));
                                                        } else {
                                                          final _student =
                                                              DataBase(
                                                                  name: _name,
                                                                  age: _age,
                                                                  job: _jobe,
                                                                  place: _place,
                                                                  phone: _phone,
                                                                  address:
                                                                      _address,
                                                                  pincode:
                                                                      _pincode,
                                                                  image:
                                                                      imagepath);
                                                          Provider.of<UserProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .editUser(
                                                                  _student,
                                                                  index);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            content: Text(
                                                                'Form Updated'),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                          ));
                                                          Navigator.of(context)
                                                              .pop();
                                                        }

                                                        ///
                                                        ///
                                                        ///
                                                        ///
                                                      },
                                                      child:
                                                          const Text('submit'))
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Provider.of<UserProvider>(context,
                                              listen: false)
                                          .deleteUser(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
    );
  }

  Future<void> _onUpdateStudentBtnclicked(
      BuildContext context, int index) async {}
}
