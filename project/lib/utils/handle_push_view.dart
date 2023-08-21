import 'package:flutter/material.dart';

void pushView(BuildContext context, dynamic route){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> route));
}

void pushReplace(BuildContext context, dynamic route){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> route));
}