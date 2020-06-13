import '../model/theme_model.dart';

abstract class IThemeRepository{
  Stream<ThemeModel> getConfgTheme();
}