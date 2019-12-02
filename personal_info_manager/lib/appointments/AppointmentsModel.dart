import '../BaseModel.dart';

class Appointment {
  int id;
  String title;
  String description;
  String apptDate;
  String apptTime;
}

class AppointmentsModel extends BaseModel {
  String apptTime;
  void setApptTime(String inApptTime) {
    apptTime = inApptTime;
    notifyListeners();
  }
}

AppointmentsModel appointmentsModel = AppointmentsModel();
