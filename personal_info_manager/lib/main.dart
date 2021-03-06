import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_info_manager/notes/NotesModel.dart';
import 'package:personal_info_manager/tasks/Tasks.dart';
import 'package:personal_info_manager/tasks/TasksModel.dart';
import "appointments/Appointments.dart";
import 'package:personal_info_manager/notes/Notes.dart';
import "contacts/Contacts.dart";
import "utils.dart" as utils;

void main() {
  startMeUp() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    utils.docsDir = docDir;
    runApp(FlutterBook());
  }

  startMeUp();
}

class FlutterBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent
      ),
      
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter PIM"), 
            bottom: TabBar( 
              tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.date_range), 
                    text: "Appointments",),
                  Tab(
                    icon: Icon(Icons.contacts), 
                    text: "Contacts",),
                  Tab(
                    icon: Icon(Icons.note), 
                    text: "Notes",),
                  
                  Tab(
                    icon: Icon(Icons.assignment_turned_in),
                    text: "Task",
                  ),

          ],
          ),
          ),
          body: TabBarView(
            children: <Widget>[
              Appointments(),
              Contacts(),
              Notes(),
              Tasks()              
            ],
          ),
        ),
      ),
    );
  }
}