class AppException implements Exception{

  final _message ;
  final _prefix ;
 AppException([this._message , this._prefix]);

 String toString(){
   return '$_message$_prefix' ;
 }
}

class FetchDataException extends AppException{
  FetchDataException(String? message) : super(message,'Error During Communication');
}

class InvalidInputExpection extends AppException{

  InvalidInputExpection(String? message) : super(message,'Invalid Input');
}

class UnauthorizedException extends AppException{
  UnauthorizedException(String? message) : super(message,'UnauthorizedException');
}

class BadRequestExpection extends AppException{
  BadRequestExpection(String? message) : super(message, 'Invalid Request');  
}