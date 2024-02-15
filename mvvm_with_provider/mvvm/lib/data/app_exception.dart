// Class for Exception handling
class AppException implements Exception {
  final _massage;
  final _prifix;

  AppException([this._massage, this._prifix]);

  String toString() => "$_prifix$_massage";
}

// class's for the diffrent type of the exceptions

class FetchDataException extends AppException {
  FetchDataException([String? massage])
      : super(massage, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? massage]) : super(massage, 'Invalid request');
}

class UnauthorizeException extends AppException {
  UnauthorizeException([String? massage])
      : super(massage, 'Unauthorize request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? massage]) : super(massage, 'invalid input');
}
