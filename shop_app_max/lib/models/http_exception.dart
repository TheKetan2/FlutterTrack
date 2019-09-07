class HttpException implements Exception {
  // Abstract class is implemented
  // Object is the base class in flutter
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    // TODO: implement toString
    // return super.toString();
    return message;
  }
}
