import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:eisenhower_matrix/ui_style_constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          S.of(context).about,
          style: appBarWhiteTextStyle,
        ),
      ),
    );
  }
}
