import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Model/model.dart';

class UserProvider extends ChangeNotifier {
  final studentBox = Hive.box<DataBase>('user');

  void addUser(DataBase user) {
    studentBox.add(user);

    notifyListeners();
  }

  void editUser(DataBase user, int key) {
    studentBox.putAt(key, user);
    notifyListeners();
  }

  void deleteUser(int index) {
    studentBox.deleteAt(index);

    notifyListeners();
  }
}
///sabik