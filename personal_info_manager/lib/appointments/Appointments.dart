import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'AppointmentsDBWorker.dart';
import 'AppointmentsList.dart';
import 'AppointmentsEntry.dart';
import 'AppointmentsModel.dart' show AppointmentsModel, appointmentsModel;

class Appointments extends StatelessWidget {
  Appointments() {
    appointmentsModel.loadData("appointments", AppointmentsDBWorker.db);
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppointmentsModel>(
      model: appointmentsModel,
      child: ScopedModelDescendant<AppointmentsModel>(
        builder: (context, inChild, inModel) {
          return IndexedStack(
            children: <Widget>[
              AppointmentsList(),
              AppointmentsEntry(),
            ],
          );
        },
      ),
    );
  }
}
