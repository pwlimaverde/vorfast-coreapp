//import 'app_shared_service_interface.dart';
//
//class SharedService implements ISharedServiceInterface {
//  static const String PRIMARI_COLOR = 'PRIMARI_COLOR';
//  static const String ACCENT_COLOR = "ACCENT_COLOR";
//
//  @override
//  String redUserInfo() {
//    return null;
//  }
//
//  @override
//  void saveUserInfo(String userInfo) {
//    return null;
//  }
//
//  @override
//  Future<int> readThemeMode() async {
//    return await LocalStorage.getValue<String>(constThemeMode).then((value) {
//      switch (value) {
//        case constThemeModeDark:
//          return ThemeMode.dark;
//          break;
//        case constThemeModeLight:
//          return ThemeMode.light;
//          break;
//        default:
//          return ThemeMode.light;
//          break;
//      }
//    });
//  }
//
//  @override
//  Future<bool> saveThemeMode(ThemeMode themeMode) async {
//    return await LocalStorage.setValue<String>(
//        constThemeMode, themeMode.toString());
//  }
//}