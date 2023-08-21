import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/response/status.dart';
import 'package:project/model/profile_model.dart';
import 'package:project/model/random_user_model.dart';
import 'package:project/repository/home_repo.dart';
import 'package:project/utils/snack_bar.dart';
import 'package:project/view/login_view.dart';

class HomeViewModel extends GetxController {
  Rx<Status> loading = Status.loading.obs;
  Rx<RandomInfoModel> randomUser = RandomInfoModel(info: Info()).obs;
  Rx<ProfileModel> profileModel = ProfileModel(user: User()).obs;

  void setLoading(Rx<Status> response) {
    loading.value = response.value;
  }

  void setRandomData(Rx<RandomInfoModel> response) {
    randomUser.value = response.value;
  }

  void setProfileData(Rx<ProfileModel> response) {
    profileModel.value = response.value;
  }

  final HomeRepository _homeRepository = HomeRepository();

  Future<void> fetchingRandomViewModel() async {
    setLoading(Status.loading.obs);
    try {
      _homeRepository.fetchingRandomRepo().then((value) {
        setLoading(Status.complete.obs);
        setRandomData(value.obs);
      });
    } catch (err) {
      debugPrint("Error: $err");
      setLoading(Status.error.obs);
    }
  }

  RxBool loadingLogout = false.obs;
  void setLogoutLoading(RxBool value) => loadingLogout.value = value.value;

  Future logoutViewModel(BuildContext context) async {
    setLogoutLoading(true.obs);
    _homeRepository.logoutRepo().then((value) {
      snackBar(context, "User Logout succcessfully");
      Get.offAll(() => const LoginView());
      setLogoutLoading(false.obs);
    }).onError((error, stackTrace) {
      debugPrint("Error: $error");
      setLogoutLoading(false.obs);
    });
  }

  Future<void> getProfileViewModel() async {
    setLoading(Status.loading.obs);
    _homeRepository.fetchingProfileRepo().then((value) {
      setLoading(Status.complete.obs);
      setProfileData(value.obs);
    }).onError((error, stackTrace) {
      setLoading(Status.error.obs);
    });
  }
}
