import 'package:flutter/material.dart';
import 'package:project/view/home_view.dart';
import 'package:project/view/profile_view.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  List<dynamic> indexPage = [const HomeView(), const ProfileView()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: indexPage[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile")
        ],
      ),
    );
  }
}
