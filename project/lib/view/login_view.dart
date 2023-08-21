import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/utils/snack_bar.dart';
import 'package:project/view/create_account_view.dart';
import 'package:project/view_model.dart/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                  hintText: "Please input your password"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() {
                return ElevatedButton(
                    onPressed: () {
                      debugPrint("Start click login");
                      if (_emailCtrl.text.isEmpty) {
                        snackBar(context, "Please input your email");
                      } else if (_passwordCtrl.text.isEmpty) {
                        snackBar(context, "Please input your password");
                      } else {
                        final Map<String, dynamic> data = {
                          "email": _emailCtrl.text,
                          "password": _passwordCtrl.text
                        };
                        debugPrint("Map: $data");
                        _authViewModel.loginViewModel(data, context);
                      }
                    },
                    child: _authViewModel.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Login"));
              }),
              ElevatedButton(
                  onPressed: () {
                    Get.to(()=>const CreateAccountUser());
                  },
                  child: const Text("SignUp"))
            ],
          )
        ],
      ),
    );
  }
}
