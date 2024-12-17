// Implements -> Abstract Base Class, Consist Empty/ Abstract Method
// Best practice to "implements" from "Exception" Abstract Base Class
class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_message";
    return "$_prefix";
  }
}

// Extends -> Inheritance

class InternetException extends AppException {
  InternetException([String? message])
      : super(message, "No Internet Connection");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Internal Server Error");
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message,
            "Error During Communication"); // when cannot connect to server
}

class ServerMaintenanceException extends AppException {
  ServerMaintenanceException([String? message])
      : super(message, "Server Maintenance Underway");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "");
}

// UnauthorisedException will be dedicated only for status code 403 (Token Expiry)
// Because on the basis of this status code, we have placed a check in logout controller to not resume the offline data uploading
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}

class NoDataFoundException extends AppException {
  NoDataFoundException([String? message]) : super(message, "No data Found");
}
