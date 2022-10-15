import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class DataBase extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  late String age;
  @HiveField(2)
  late String job;
  @HiveField(3)
  late String place;
  @HiveField(4)
  final String image;
  @HiveField(5)
  String address;
  @HiveField(6)
  String pincode;
  @HiveField(7)
  String phone;

  DataBase({
    required this.name,
    required this.age,
    required this.job,
    required this.place,
    required this.image,
    required this.address,
    required this.phone,
    required this.pincode,
  });
}
