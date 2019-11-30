import 'package:scoped_model/scoped_model.dart';

class BaseModel extends Model {
  int stackIndex = 0;
  List entityList = [];
  var entityBeingEdited;
  String chosenDate;

  void setChosenDate(String inDate) {
    chosenDate = inDate;
    notifyListeners();
  }

  void loadData(String inEntityType, dynamic inDatabase) async {
    entityList = await inDatabase.getAll();
    notifyListeners();
  }

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;
    notifyListeners();
  }

  
}
