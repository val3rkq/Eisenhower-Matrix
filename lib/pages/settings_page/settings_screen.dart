import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          S.of(context).settings,
          style: appBarWhiteTextStyle,
        ),
      ),
      body: Center(
        child: Lottie.asset('assets/lottie/settings.json', width: MediaQuery.of(context).size.width - 100),
      ),
    );
  }
}
