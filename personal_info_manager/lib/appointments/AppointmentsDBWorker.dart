import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../utils.dart' as utils;
import 'AppointmentsModel.dart';

class AppointmentsDBWorker {
  AppointmentsDBWorker._();
  static final AppointmentsDBWorker db = AppointmentsDBWorker._();
  Database _db;

  Future get database async {
    if (_db == null) {
      _db = await init();
    }
    return _db;
  }

  Future<Database> init() async {
    String path = join(utils.docsDir.path, "appointments.db");

    Database db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database inDB, int inVersion) async {
      await inDB.execute("CREATE TABLE IF NOT EXISTS appointments("
          "id INTEGER PRIMARY KEY,"
          "title TEXT, description TEXT,"
          "apptDate TEXT, apptTime TEXT"
          ")");
    });
    return db;
  }

  Appointment appointmentFromMap(Map inMap) {
    Appointment appointment = Appointment();
    appointment.id = inMap["id"];
    appointment.title = inMap["title"];
    appointment.description = inMap["description"];
    appointment.apptDate = inMap["apptDate"];
    appointment.apptTime = inMap["apptTime"];

    return appointment;
  }

  Map<String, dynamic> appointmentToMap(Appointment appointment) {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = appointment.id;
    map["title"] = appointment.title;
    map["description"] = appointment.description;
    map["apptDate"] = appointment.apptDate;
    map["apptTime"] = appointment.apptTime;
    return map;
  }

  Future create(Appointment inAppointment) async {
    Database db = await database;
    var val = await db.rawQuery("SELECT MAX(id) + 1 AS id FROM appointments");
    int id = val.first["id"];
    if (id == null) {
      id = 1;
    }
    return await db.rawInsert(
        "INSERT INTO appointments (id, title, description, apptDate, apptTime) VALUES(?,?,?,?,?)",
        [
          id,
          inAppointment.title,
          inAppointment.description,
          inAppointment.apptDate,
          inAppointment.apptTime
        ]);
  }

  Future<Appointment> get(int inID) async {
    Database db = await database;
    var rec =
        await db.query("appointments", where: "id = ?", whereArgs: [inID]);
    return appointmentFromMap(rec.first);
  }

  Future<List> getAll() async {
    Database db = await database;
    var recs = await db.query("appointments");
    var list =
        recs.isNotEmpty ? recs.map((m) => appointmentFromMap(m)).toList() : [];
    return list;
  }

  Future update(Appointment appointment) async {
    Database db = await database;

    return await db.update("appointments", appointmentToMap(appointment),
        where: "id=?", whereArgs: [appointment.id]);
  }

  Future delete(int inID) async {
    Database db = await database;
    return await db.delete("appointments", where: "id=?", whereArgs: [inID]);
  }
}
