import 'dart:async';

import '../../models/auth_info_model/auth_info_model.dart';
import '../../models/user_model/user_model.dart';

final authInfo = <String, dynamic>{
  'user': {
    'id': 'aksdghkasjdkalshdjkasg',
    'email': 'chlp@mail.com',
    'createdAt': DateTime.now().toString(),
    'updatedAt': DateTime.now().toString(),
    'firstName': 'Raffi',
    'lastName': 'Martirosyan',
    'phoneNumber': '091111111',
  },
  'token': {
    'token': 'currentToken',
    'expiredIn': 5,
  }
};

class AuthRepository {
  // static Future<UserModel> getCurrentUser() async {
  //   final res = await http.get(
  //     '/auth/me',
  //   );
  //   return UserModel.fromJson(res.data);
  // }

  static Future<String> sendPhoneNumber(String phoneNumber) async {
    // final res = await dio.post(
    //   '/signIn',
    //   data: phoneNumber,
    // );
    // return res.data;
    const token = 'tmp_token';
    return token;
  }

  static Future<AuthInfoModel> sendVerificationCode(
    String verificationCode,
    String tmpToken,
  ) async {
    // final res = await dio.post(
    //   '/signIn',
    //   options: Options(
    //     headers: {
    //       'tmpToken': tmpToken,
    //     },
    //   ),
    //   data: {
    //     'code': verificationCode,
    //   },
    // );

    return AuthInfoModel.fromJson(authInfo);
    // const token = 'tmp_token';
    // return token;
  }
}
