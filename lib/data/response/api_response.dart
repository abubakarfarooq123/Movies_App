import 'package:mvvm_test_app/data/response/status.dart';

class ApiResponse<T> {

  Status? status ;
  T? data ;
  String? message ;

  ApiResponse([this.status,this.message,this.data]);

  ApiResponse.loading() : status = Status.LOADING ;

  ApiResponse.error(this.message) : status = Status.ERROR ;

  ApiResponse.completed(this.data) : status = Status.COMPLETED ;


  @override
  String toString(){

    return 'Status : $status \n Message : $message \n Data : $data';

  }


}