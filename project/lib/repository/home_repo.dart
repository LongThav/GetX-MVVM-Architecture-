import 'package:flutter/material.dart';
import 'package:project/db_helper/cache_token.dart';
import 'package:project/model/random_user_model.dart';
import 'package:project/rest/url_base.dart';
import 'package:project/utils/get_header.dart';

import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/profile_model.dart';

class HomeRepository {
  final BaseApiService _baseApiService = NetworkApiService();

  Future<RandomInfoModel> fetchingRandomRepo() async {
    try {
      dynamic response = await _baseApiService.getGetApiResponse(randomUserUrl);
      return RandomInfoModel.fromJson(response);
    } catch (err) {
      throw Exception(err);
    }
  }

  final CacheToken _cacheToken = CacheToken();
  Future logoutRepo() async {
    try {
      String token = await _cacheToken.getToken();
      debugPrint("Token: $token");
      dynamic response = await _baseApiService.getPostApiResponse(
          mainUrl + logout,
          requestHeaders: getHeaders(token));
      return response;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<ProfileModel> fetchingProfileRepo() async {
    try {
      String token = await _cacheToken.getToken();
      debugPrint("Token: $token");
      dynamic response = await _baseApiService.getGetApiResponse(
          mainUrl + getProfile,
          requestHeaders: getHeaders(token));
      debugPrint("Responnse: $response");
      return ProfileModel.fromJson(response);
    } catch (err) {
      throw Exception(err);
    }
  }
}
