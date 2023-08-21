import 'package:flutter/material.dart';
import 'package:project/data/network/base_api_service.dart';
import 'package:project/data/network/network_api_service.dart';
import 'package:project/model/login_model.dart';
import 'package:project/rest/url_base.dart';

class AuthRepository {
  BaseApiService baseApiService = NetworkApiService();

  Future<SignInModel> loginRepo(dynamic data) async {
    try {
      dynamic response =
          await baseApiService.getPostApiResponse(mainUrl + signIn, data: data);
      debugPrint("Response: $response");
      return SignInModel.fromJson(response);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future signUpRepo(dynamic data) async {
    try {
      dynamic response =
          await baseApiService.getPostApiResponse(mainUrl + signUp, data: data);
      return response;
    } catch (err) {
      throw Exception(err);
    }
  }
}
