import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../main.dart';
import '../../../../sharedpreferences/localnetwork.dart';
import 'authcubit_dart_state.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthcubitDartCubit extends Cubit<AuthStates> {
  AuthcubitDartCubit() : super(AuthInitialState());

  void register(
      {required String email,
      required String name,
      required String phone,
      required String password}) async {
    emit(RegisterLoadingState());
    try {
      var response = await http.post(
        // request Url = base url + method url ( endpoint ) = https://student.valuxapps.com + /api/register
        Uri.parse('https://student.valuxapps.com/api/register'),

        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'image': "jdfjfj",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          debugPrint("Response is : $data");
          emit(RegisterSuccessState());
        } else {
          debugPrint("Response is : $data");
          emit(FailedToRegisterState(message: data['message']));
        }
      }
    } catch (e) {
      debugPrint("Failed to Register , reason : $e");
      emit(FailedToRegisterState(message: e.toString()));
    }
  }

  // Todo: API URL => https://student.valuxapps.com/api/
  // Todo: Login endpoint => login
  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      var response = await http.post(
        // request Url = base url + method url ( endpoint ) = https://student.valuxapps.com + /api/register
        Uri.parse('https://student.valuxapps.com/api/login'),

        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["status"] == 200) {
          // debugPrint("Response is : $data");
          await CacheNetwork.insertToCache(
              key: "token", value: data["data"]["token"]);
          await CacheNetwork.insertToCache(key: "password", value: password);
          userToken = await CacheNetwork.getCacheData(key: "token");
          currentPassword = await CacheNetwork.getCacheData(key: "password");
          emit(LoginSuccessState());
        } else {
          debugPrint("Response is : $data");
          emit(FailedToLoginState(message: data["msg"]));
        }
      }
    } catch (e) {
      debugPrint("Failed to Login , reason : $e");
      emit(FailedToLoginState(message: e.toString()));
    }
  }
}
