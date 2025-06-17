import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Here The Initialize of cache .
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! this method to get string data from local database using key
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! this method to put data in local database using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    try {
      if (value is bool) {
        return await sharedPreferences.setBool(key, value);
      } else if (value is String) {
        return await sharedPreferences.setString(key, value);
      } else if (value is int) {
        return await sharedPreferences.setInt(key, value);
      } else if (value is double) {
        return await sharedPreferences.setDouble(key, value);
      } else {
        // Handle unsupported types
        print('Unsupported type: ${value.runtimeType} for key: $key');
        // Convert to string as fallback
        return await sharedPreferences.setString(key, value.toString());
      }
    } catch (e) {
      print('Error saving data: $e');
      return false;
    }
  }

  //! this method to get data already saved in local database
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! remove data using specific key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! clear all data in the local database
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //! this method to put data in local database using key
  Future<bool> put({
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value is String) {
        return await sharedPreferences.setString(key, value);
      } else if (value is bool) {
        return await sharedPreferences.setBool(key, value);
      } else if (value is int) {
        return await sharedPreferences.setInt(key, value);
      } else if (value is double) {
        return await sharedPreferences.setDouble(key, value);
      } else {
        // Convert to string as fallback
        return await sharedPreferences.setString(key, value.toString());
      }
    } catch (e) {
      print('Error putting data: $e');
      return false;
    }
  }

  //! Method to save token specifically
  Future<bool> saveToken(String? token) async {
    if (token == null || token.isEmpty) {
      return await removeData(key: 'token');
    }
    return await saveData(key: 'token', value: token);
  }

  //! Method to get token specifically
  String? getToken() {
    return getDataString(key: 'token');
  }
}
