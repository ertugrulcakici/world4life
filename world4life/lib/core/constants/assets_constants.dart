class AssetConstant {
  static AssetConstant instance = AssetConstant._init();
  AssetConstant._init();
  String SPLASH_SCREEN = _gif("splash_screen");
  String kupa_level = _svg("ic_kupa_level_1");
  String organic = _png("organic");
  String battery = _png("battery");
  String bread = _png("bread");
  String glass = _png("glass");
  String metal = _png("metal");
  String APP_LOGO = _svg("app_logo");

  static String _svg(String _name) => "assets/svg/" + _name + ".svg";
  static String _gif(String _name) => "assets/gif/" + _name + ".gif";
  static String _png(String _name) => "assets/png/" + _name + ".png";
}
