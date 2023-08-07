import 'package:another_flushbar/flushbar.dart';
import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/pages/home_page/widgets/all.dart';
import 'package:eisenhower_matrix/ui_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<int, dynamic> data = {
    1: [],
    2: [],
    3: [],
    4: [],
  };

  int selectedField = 1;

  // controller
  TextEditingController taskController = TextEditingController();

  bool isUrgent = true;
  bool isImportant = true;

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

  void onAddBtnTap() {
    // show dialog
    showDialog(
      context: context,
      builder: (context) => _showDialog(context),
    ).then((value) {
      taskController.clear();
    });
  }

  // TODO
  void onEditTap(BuildContext context, int fieldIndex, int index) {
    setState(() {
      taskController.text = data[fieldIndex][index].toString();
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

  void addNewTask() {
    setState(() {
      data[getIndexForData(isUrgent, isImportant)]
          .add(taskController.text.trim().toString());
    });
    _closeDialog();
  }

  void deleteTask(int fieldIndex, int index) {
    setState(() {
      data[fieldIndex].removeAt(index);
    });
  }

  void editTask(int fieldIndex, int index, int newFieldIndex) {
    setState(() {
      if (fieldIndex != newFieldIndex) {
        data[fieldIndex].removeAt(index);
        data[newFieldIndex].add(taskController.text);
      } else {
        data[fieldIndex][index] = taskController.text;
      }
    });
    _closeDialog();
  }

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      drawer: const MyDrawer(),
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
                  data: data,
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
              isImportant: isImportant,
              isUrgent: isUrgent,
            ),

            // check importance
            TaskStatusBox(
              checkUrgency: false,
              text: S.of(context).important,
              onBtnTap: (index) => onImportantBtnTap(index),
              isImportant: isImportant,
              isUrgent: isUrgent,
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
            )
          ],
        ),
      ),
    );
  }

  void _closeDialog() {
    Navigator.of(context).pop();
    taskController.clear();
    // change values
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
  }
}
