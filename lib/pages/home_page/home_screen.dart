import 'package:another_flushbar/flushbar.dart';
import 'package:eisenhower_matrix/constants.dart';
import 'package:eisenhower_matrix/database/db.dart';
import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/pages/home_page/widgets/all.dart';
import 'package:eisenhower_matrix/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // database
  DB db = DB();
  var box = Hive.box(boxName);

  // initial data
  int selectedField = 1;
  bool isUrgent = true;
  bool isImportant = true;

  // controller
  TextEditingController taskController = TextEditingController();

  void onUrgentBtnTap(int index) {
    setState(() {
      if (index == 0) {
        isUrgent = false;
      } else {
        isUrgent = true;
      }
    });
  }

  void onImportantBtnTap(int index) {
    setState(() {
      if (index == 0) {
        isImportant = false;
      } else {
        isImportant = true;
      }
    });
  }

  void changeFieldOnTap(int fieldIndex) {
    setState(() {
      selectedField = fieldIndex;
      switch (selectedField) {
        case 1:
          isUrgent = true;
          isImportant = true;
        case 2:
          isUrgent = false;
          isImportant = true;
        case 3:
          isUrgent = true;
          isImportant = false;
        default:
          isUrgent = false;
          isImportant = false;
      }
    });
  }

  void getFieldIndex() {
    // change values
    setState(() {
      if (isUrgent) {
        if (isImportant) {
          selectedField = 1;
        } else {
          selectedField = 3;
        }
      } else {
        if (isImportant) {
          selectedField = 2;
        } else {
          selectedField = 4;
        }
      }
    });
  }

  void onAddBtnTap() {
    // show dialog
    showDialog(
      context: context,
      builder: (context) => _showDialog(context),
    ).then((value) {
      taskController.clear();
    });
  }

  void onEditTap(BuildContext context, int fieldIndex, int index) {
    setState(() {
      taskController.text = db.data[fieldIndex][index].toString();
    });
    // show dialog for edit
    showDialog(
      context: context,
      builder: (context) => _showDialog(context,
          isEdit: true, fieldIndex: fieldIndex, index: index),
    ).then((value) {
      taskController.clear();
    });
  }

  void addNewTask() {
    setState(() {
      db.data[getIndexForData(isUrgent, isImportant)]
          .insert(0, taskController.text.trim().toString());
    });
    db.updateDB();
    _closeDialog();
  }

  void editTask(int fieldIndex, int index, int newFieldIndex) {
    setState(() {
      if (fieldIndex != newFieldIndex) {
        db.data[fieldIndex].removeAt(index);
        db.data[newFieldIndex].insert(0, taskController.text.trim().toString());
      } else {
        db.data[fieldIndex][index] = taskController.text.trim().toString();
      }
    });
    _closeDialog();
    db.updateDB();
  }

  void deleteTask(int fieldIndex, int index) {
    setState(() {
      db.data[fieldIndex].removeAt(index);
    });
    db.updateDB();
  }

  @override
  void initState() {
    super.initState();
    if (box.get('DATA') == null) {
      db.initData();
    } else {
      db.getData();
    }

    GetIt.I.registerSingleton<Function(int, int)>(deleteTask);
    GetIt.I.registerSingleton<Function(BuildContext, int, int)>(onEditTap);
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    db.getData();
    return Scaffold(
      drawer: MyDrawer(
        updateHomeScreen: () {
          setState(() {});
        },
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(S.of(context).app_name),
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          // tagline
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 15),
            child: Text(S.of(context).tagline, style: bodyTextStyle),
          ),

          // main content
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Fields(
                  changeFieldOnTap: changeFieldOnTap,
                  selectedField: selectedField,
                  data: db.data,
                ),

                // ADD - button
                AddTaskBtn(
                  onTap: onAddBtnTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showDialog(BuildContext context,
      {isEdit = false, fieldIndex = -1, index = -1}) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(20),
        height: 460,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).write_task,
              style: mediumTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              autofocus: true,
              controller: taskController,
              decoration: InputDecoration(
                hintText: S.of(context).hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: borderTextFieldColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: borderTextFieldFocusedColor),
                ),
              ),
              maxLines: 6,
            ),

            // check urgency
            TaskStatusBox(
              checkUrgency: true,
              text: S.of(context).urgent,
              onBtnTap: (index) => onUrgentBtnTap(index),
              isImportant:
                  isEdit ? fieldIndex == 1 || fieldIndex == 2 : isImportant,
              isUrgent: isEdit ? fieldIndex == 1 || fieldIndex == 3 : isUrgent,
            ),

            // check importance
            TaskStatusBox(
              checkUrgency: false,
              text: S.of(context).important,
              onBtnTap: (index) => onImportantBtnTap(index),
              isImportant:
                  isEdit ? fieldIndex == 1 || fieldIndex == 2 : isImportant,
              isUrgent: isEdit ? fieldIndex == 1 || fieldIndex == 3 : isUrgent,
            ),

            const SizedBox(
              height: 5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: S.of(context).cancel,
                  onTap: () {
                    _closeDialog();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: isEdit ? S.of(context).edit : S.of(context).add,
                  onTap: () {
                    // check if task is not empty
                    if (taskController.text.trim().isEmpty) {
                      // use flushbar instead of snackbar
                      // because snackbar is opening on the background
                      Flushbar(
                        backgroundColor: Colors.white,
                        messageColor: Colors.black,
                        message: S.of(context).task_is_empty,
                        duration: const Duration(seconds: 2),
                      ).show(context);
                    } else {
                      if (isEdit) {
                        editTask(fieldIndex, index,
                            getIndexForData(isUrgent, isImportant));
                      } else {
                        addNewTask();
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _closeDialog() {
    Navigator.of(context).pop();
    taskController.clear();
    getFieldIndex();
  }
}
