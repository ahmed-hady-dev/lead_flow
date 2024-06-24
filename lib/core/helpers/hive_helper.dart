import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static final Box _appBox = Hive.box('app_box');

  static Box get appBox => _appBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('app_box');
  }

  static Future<void> write({
    required String key,
    required dynamic value,
  }) async =>
      await _appBox.put(key, value);
  static dynamic read({required String key}) async => await _appBox.get(key);

  static bool hasData({required String key}) => _appBox.containsKey(key);

  static Future<void> checkOnBoardingComplete() async => await write(key: 'onBoarding', value: true);

  static Future<bool> getOnBoardingValue() async {
    bool isOnBoardingChecked = false;
    if (hasData(key: 'onBoarding')) {
      isOnBoardingChecked = await read(key: 'onBoarding');
    }
    return isOnBoardingChecked;
  }




  static Future<void> cacheUserToken({required String token}) async => await _appBox.put('token', token);

  static String? get getUserToken => _appBox.get('token');
  static bool get isLogged => getUserToken != null;
  static get getUserModel {
    dynamic userModel;
    if (_appBox.containsKey('userModel')) {
      try {
        userModel = _appBox.get('userModel');
      } catch (e) {
        print('|==|' * 22);
        print('HiveHelper.getUserInfo');
        print(e.toString());
        print('|==|' * 22);
      }
    }
    return userModel;
  }

}
