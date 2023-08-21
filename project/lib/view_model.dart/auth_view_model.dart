import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/db_helper/cache_token.dart';
import 'package:project/repository/auth_repo.dart';
import 'package:project/utils/handle_push_view.dart';
import 'package:project/utils/snack_bar.dart';
import 'package:project/view/index_view.dart';

class AuthViewModel extends GetxController {
  
  RxBool isLoading = false.obs;
  void setLoadingLogin(RxBool value){
    isLoading.value = value.value;
  }

  final AuthRepository _authRepository = AuthRepository();
  final CacheToken _cacheToken = CacheToken();

  Future loginViewModel(dynamic data, BuildContext context) async {
    setLoadingLogin(true.obs);
    _authRepository.loginRepo(data).then((value) {
      _cacheToken.writeToken(value.login.token);
      snackBar(context, "User Login successfully");
      pushReplace(context, const IndexView());
      setLoadingLogin(false.obs);
    }).onError((error, stackTrace) {
      setLoadingLogin(false.obs);
    });
  }

  RxBool signUpLoading = false.obs;
  void setLoadingSignUp(RxBool value){
    signUpLoading.value = value.value;
  }

  Future signUpViewModel(dynamic data, BuildContext context)async{
    setLoadingSignUp(true.obs);
    _authRepository.signUpRepo(data).then((value){
      snackBar(context, "User create account successfully");
      setLoadingSignUp(false.obs);
    }).onError((error, stackTrace){
      snackBar(context, "Your email has been use");
      debugPrint("Error: $error");
      setLoadingSignUp(false.obs);
    });
  }
}

