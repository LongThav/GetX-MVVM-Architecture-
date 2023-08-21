import 'package:project/data/response/status.dart';

class ApiResponse<T> {
  final Status? status;
  T? data;
  String? message;
  ApiResponse([this.status, this.data, this.message]);

  // Named Constructor
  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.complete;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status: $status\n Error: $message\n Data: $data";
  }
}