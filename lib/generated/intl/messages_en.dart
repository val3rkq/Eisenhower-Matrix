// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(text) => "Is this task ${text}?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("About"),
    "add" : MessageLookupByLibrary.simpleMessage("Add"),
    "app_name" : MessageLookupByLibrary.simpleMessage("Eisenhower Matrix"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "choose_group" : MessageLookupByLibrary.simpleMessage("Choose group for your task"),
    "done_tasks" : MessageLookupByLibrary.simpleMessage("Done Tasks"),
    "edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "hint" : MessageLookupByLibrary.simpleMessage("Your Task.."),
    "important" : MessageLookupByLibrary.simpleMessage("important"),
    "is_this_task" : m0,
    "no" : MessageLookupByLibrary.simpleMessage("No"),
    "not" : MessageLookupByLibrary.simpleMessage("not"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "tagline" : MessageLookupByLibrary.simpleMessage("Boost your productivity"),
    "task_is_empty" : MessageLookupByLibrary.simpleMessage("Task can\'t be empty"),
    "urgent" : MessageLookupByLibrary.simpleMessage("urgent"),
    "write_task" : MessageLookupByLibrary.simpleMessage("Write the task"),
    "yes" : MessageLookupByLibrary.simpleMessage("Yes")
  };
}
