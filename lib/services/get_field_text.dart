import 'package:eisenhower_matrix/generated/l10n.dart';
import 'package:flutter/material.dart';

List<String> getFieldText(BuildContext context, int index) {
  switch (index) {
    case 1:
      return [S.of(context).urgent, S.of(context).important];
    case 2:
      return ['${S.of(context).not} ${S.of(context).urgent}', S.of(context).important];
    case 3:
      return [S.of(context).urgent, S.of(context).important];
    case 4:
      return ['${S.of(context).not} ${S.of(context).urgent}', '${S.of(context).not} ${S.of(context).important}'];
    default:
      return [S.of(context).urgent, S.of(context).important];
  }
}