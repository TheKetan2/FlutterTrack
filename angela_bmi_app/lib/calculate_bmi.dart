import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;

  CalculateBMI({this.height, this.weight});

  double _bmi;

  String calcBMI() {
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
  }


  String getResult() {
    if (_bmi >= 25.0){
      print(_bmi);
      return 'Overweight';
    }
    else if (_bmi >= 18.5){
      print(_bmi);
      return 'Normal';
    }
    else{
      print(_bmi);
      return 'Underweight';
    }
  }

  String getInterpret(){
    if (_bmi >= 25)
      return 'Work hard in gym you fatman';
    else if (_bmi > 18.5)
      return 'Healthy Boy, keep it up';
    else
      return 'Get some calories';
  }
}
