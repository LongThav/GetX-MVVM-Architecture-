import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/response/status.dart';
import 'package:project/db_helper/cache_token.dart';
import 'package:project/view_model.dart/home_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final CacheToken _cacheToken = CacheToken();
  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());
  @override
  void initState() {
    _homeViewModel.getProfileViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile View"),
        actions: [
          IconButton(
              onPressed: () {
                _cacheToken.deleteAll(context);
                _homeViewModel.logoutViewModel(context);
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Obx(() {
      if (_homeViewModel.loading.value == Status.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_homeViewModel.loading.value == Status.error) {
        return const Center(
          child: Text("Error"),
        );
      } else {
        return _buildProfile();
      }
    });
  }

  Widget _buildProfile(){
    return Obx((){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${_homeViewModel.profileModel.value.user.username}"),
            Text("Name: ${_homeViewModel.profileModel.value.user.email}"),
          ],
        ),
      );
    });
  }
}
