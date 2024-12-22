import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/features/auth/data/model/user_model.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  // Rx<User?> currentUser = Rx(null);
  Rxn<UserModel>? currentUser = Rxn<UserModel>();

  Future<UserService> init() async {
    await getUser();
    return this;
  }

  Future getUser() async {
    currentUser?.value = CashHelper.getData(CacheKeys.userModel) == null
        ? null
        : UserModel.fromJson(
            json.decode(CashHelper.getData(CacheKeys.userModel)));

    return unit;
  }

  Future setUser(UserModel userModel) async {
    CashHelper.setData(CacheKeys.userModel, json.encode(userModel.toJson()));
    currentUser?.value = userModel;
    return unit;
  }
}
