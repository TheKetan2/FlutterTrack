// TODO Implement this library.
import 'package:flutter/cupertino.dart';

import '../BaseModel.dart';

class Note {
  int id;
  String title;
  String content;
  String color;
  String toString() {
    return "{id=$id, title=$title, "
        "content=$content, color=$color}";
  }
}

class NotesModel extends BaseModel {
  String color;
  void setColor(String inColor) {
    color = inColor;
    notifyListeners();
  }
}

NotesModel notesModel = NotesModel();
