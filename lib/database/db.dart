import 'package:eisenhower_matrix/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DB {
  var box = Hive.box(boxName);
  late var data;

  void initData() {
    data = {
      1: [],
      2: [],
      3: [],
      4: [],
    };
  }

  void getData() {
    data = box.get('DATA');
  }

  void updateDB() {
    box.put('DATA', data);
  }
}
