import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/pages/about_page/about_screen.dart';
import 'package:eisenhower_matrix/pages/done_tasks_page/done_task_screen.dart';
import 'package:eisenhower_matrix/pages/settings_page/settings_screen.dart';
import 'package:eisenhower_matrix/ui_style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).app_name,
                          style: appBarTextStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_circle_left, size: 30,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  color: mainColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.bookmarks,
                          color: Colors.white,
                        ),
                        title: Text(
                          S.of(context).done_tasks,
                          style: drawerTileTextStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const DoneTaskPage(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.settings_rounded,
                          color: Colors.white,
                        ),
                        title: Text(
                          S.of(context).settings,
                          style: drawerTileTextStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const SettingsPage(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.contact_support_rounded,
                          color: Colors.white,
                        ),
                        title: Text(
                          S.of(context).about,
                          style: drawerTileTextStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const AboutPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Lottie.asset(
                          'assets/lottie/main.json',
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
