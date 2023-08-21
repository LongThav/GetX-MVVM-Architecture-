import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/response/status.dart';
import 'package:project/view_model.dart/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());
  @override
  void initState() {
    _homeViewModel.fetchingRandomViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (_homeViewModel.loading.value == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (_homeViewModel.loading.value == Status.error) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return _buildItem();
        }
      }),
    );
  }

  Widget _buildItem() {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: () async {
          _homeViewModel.fetchingRandomViewModel();
        },
        child: ListView.builder(
            itemCount: _homeViewModel.randomUser.value.results.length,
            itemBuilder: (context, index) {
              var data = _homeViewModel.randomUser.value.results[index];
              return ListTile(
                leading: Text("Id: $index"),
                title: Text("Name: ${"${data.name.first} ${data.name.last}"}"),
                subtitle: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data.picture.medium),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
            }),
      );
    });
  }
}
