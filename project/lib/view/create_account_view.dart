import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/utils/snack_bar.dart';
import 'package:project/view_model.dart/auth_view_model.dart';

class CreateAccountUser extends StatefulWidget {
  const CreateAccountUser({super.key});

  @override
  State<CreateAccountUser> createState() => _CreateAccountUserState();
}

class _CreateAccountUserState extends State<CreateAccountUser> {
  final TextEditingController _userNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  @override
  void dispose() {
    _userNameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create user Account"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: _userNameCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Please input your username"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Please input your email address"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: _passwordCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Please input your password address"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() {
            return ElevatedButton(
                onPressed: () {
                  if (_userNameCtrl.text.isEmpty) {
                    snackBar(context, "Please input username");
                  } else if (_emailCtrl.text.isEmpty) {
                    snackBar(context, "Please input email");
                  } else if (_passwordCtrl.text.isEmpty) {
                    snackBar(context, "Please input password");
                  } else {
                    final Map<String, dynamic> data = {
                      "username": _userNameCtrl.text,
                      "email": _emailCtrl.text,
                      "password": _passwordCtrl.text
                    };
                    _authViewModel.signUpViewModel(data, context);
                  }
                },
                child: _authViewModel.signUpLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Create account"));
          }),
        ],
      ),
    );
  }
}
