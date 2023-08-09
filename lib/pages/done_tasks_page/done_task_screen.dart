import 'package:another_flushbar/flushbar.dart';
import 'package:eisenhower_matrix/database/db.dart';
import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widgets/all.dart';

class DoneTaskPage extends StatefulWidget {
  const DoneTaskPage({super.key});

  @override
  State<DoneTaskPage> createState() => _DoneTaskPageState();
}

class _DoneTaskPageState extends State<DoneTaskPage> {
  bool isDataUpdated = false;

  // database
  DB db = DB();

  void deleteDoneTask(int index) {
    setState(() {
      db.doneTasks.removeAt(index);
    });
    db.updateDB();
  }

  void returnTask(int index) {
    setState(() {
      isDataUpdated = true;
    });
    String taskText = db.doneTasks[index][0];
    int taskFieldIndex = db.doneTasks[index][1];
    db.data[taskFieldIndex].insert(0, taskText);
    deleteDoneTask(index);
  }

  void deleteAll() {
    if (db.doneTasks.isNotEmpty) {
      // show dialog for accepting
      showDialog(
        context: context,
        builder: (context) {
          return AcceptDialog(
            onTap: () {
              setState(() {
                db.doneTasks = [];
              });
              db.updateDB();
              Navigator.of(context).pop();
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    db.getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (isDataUpdated) {
              Flushbar(
                backgroundColor: Colors.white,
                messageColor: Colors.black,
                message: S.of(context).update_matrix,
                icon: const Icon(Icons.update_rounded),
                duration: const Duration(seconds: 2),
              ).show(context);
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          S.of(context).done_tasks,
          style: appBarWhiteTextStyle,
        ),
      ),
      body: db.doneTasks.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: db.doneTasks.length,
              itemBuilder: (context, index) {
                return DoneTaskTile(
                  index: index,
                  db: db,
                  onReturnTap: () => returnTask(index),
                  onDeleteTap: () => deleteDoneTask(index),
                );
              },
            )
          : Center(
              child: Lottie.asset('assets/lottie/no_data.json',
                  width: MediaQuery.of(context).size.width - 100,
                  fit: BoxFit.contain),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: deleteAll,
        backgroundColor: mainColor,
        child: const Icon(Icons.delete_forever_rounded),
      ),
    );
  }
}
