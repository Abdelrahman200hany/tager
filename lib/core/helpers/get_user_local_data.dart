import 'dart:convert';

import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/servies/shared_preferense_singleton.dart';
import 'package:tager/feature/auth_feature/data/models/user_model.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';

UserEntity getUserData() {
  var jesonData = Prefs.getString(kPUserDataSaved);
  var userData = UserModel.fromjeson(jsonDecode(jesonData));
  return userData;
}
