import 'package:eisenhower_matrix/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DB {
  var box = Hive.box(boxName);
  late var data;
  late List doneTasks;

  void initData() {
    data = {
      1: [],
      2: [],
      3: [],
      4: [],
    };
    doneTasks = [];
    updateDB();
  }

  void getData() {
    data = box.get('DATA');
    doneTasks = box.get('DONE_TASKS');
  }

  void updateDB() {
    box.put('DATA', data);
    box.put('DONE_TASKS', doneTasks);
  }
}
