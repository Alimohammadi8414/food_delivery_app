import 'package:flutter/material.dart';
import 'package:hellofood/main.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hive/hive.dart';

class SignupProvider extends ChangeNotifier {
  var box = Hive.box<User>('User');

  Future<void> signUp({
    required String name,
    required String lastName,
    required int phone,
    required String password,
  }) async {
    await box.add(
      User(name: name, lastName: lastName, phone: phone, password: password),
    );
    messengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(box.values.first.name!)),
    );
  }
}
