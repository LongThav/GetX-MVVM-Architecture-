import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheToken{
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  String keyToken = "";
  String noKeyToken = "noKey";

  void writeToken(String value){
    _flutterSecureStorage.write(key: keyToken, value: value);
  }

  Future<String> getToken()async{
    String? tokenUser = await _flutterSecureStorage.read(key: keyToken);
    return tokenUser ?? noKeyToken;
  }

  void deleteAll(BuildContext context){
    _flutterSecureStorage.deleteAll();
  }
}