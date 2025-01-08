import 'package:get_storage/get_storage.dart';

import 'caching_keys.dart';
import 'entities/check_update_entity.dart';
import 'entities/get_information_entity.dart';

class PreferenceManager {
  void saveFCMToken(String fcmToken) => GetStorage().write(CachingKey.FCM_TOKEN, fcmToken);

  String fcmToken() => GetStorage().read(CachingKey.FCM_TOKEN) as String ?? "";

  void saveIsDarkMode(bool isDark) => GetStorage().write(CachingKey.IS_DARK_MODE, isDark);

  bool isDarkMode() => GetStorage().read(CachingKey.IS_DARK_MODE) as bool? ?? false;

  void saveIsFirstTime(bool isFirstTime) => GetStorage().write(CachingKey.IS_FIRST_TIME, isFirstTime);

  bool isFirstTime() => GetStorage().read(CachingKey.IS_FIRST_TIME) as bool? ?? true;



  void saveAuthToken(String authToken) => GetStorage().write(CachingKey.AUTHEN_TOKEN, authToken != "" ? authToken : "");

  String authToken() => GetStorage().read(CachingKey.AUTHEN_TOKEN) as String? ?? "";

  void saveUser(GetInformationEntity userData) => GetStorage().write(CachingKey.USER, userData.toJson());
  GetInformationEntity? currentUser() => GetInformationEntity.fromJson(GetStorage().read(CachingKey.USER));

  void saveLanguage(String lang) => GetStorage().write(CachingKey.LANGUAGE, lang);

  String currentLang() => GetStorage().read(CachingKey.LANGUAGE) as String? ?? "en";


  void setStoreID(String storeId) => GetStorage().write(CachingKey.STORE_ID, storeId);

  String getStoreID() => GetStorage().read(CachingKey.STORE_ID) as String? ?? "";

  // saveInformation(GetInformationEntity getInformationEntity) async {
  //   return await GetStorage().write(CachingKey.USER_MODEL, getInformationEntity.toJson());
  // }
  //
  // GetInformationEntity getInformationEntity() => GetInformationEntity.fromJson(GetStorage().read(CachingKey.USER_MODEL));



  void logout() {
    GetStorage().remove(CachingKey.USER);
    GetStorage().remove(CachingKey.AUTHEN_TOKEN);
  }


}
