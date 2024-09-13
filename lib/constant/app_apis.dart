class Apis {
  // static String baseURL = FlavorConfig.baseUrl;
  // static String baseURL2 = FlavorConfig.baseURL2;
  // static String authURL = FlavorConfig.authURL;
  static const String baseURL = "192.168.29.86";
  static const String domain = "http://192.168.29.86";
  static const String symbolURL = "";
  static const String liveURL = "$domain/live/";
  static const String commonURL = "$domain/common/";
  static const String authURL = "$domain/user/";

  static const String loginURL = "$domain:8081/login/validate";
  static const String signUpURL = "$domain:8081/login/validate";
  static const String watchListAPI = "$domain:8081/watchlist/list-by-index/";
  static const String walletFilter = "$domain:8081/wallet/filter";
  static const String walletBalance = "$domain:8081/wallet/balance";
  static const String removeWatchListItem = "$domain:8081/watchlist/remove";
  static const String scriptListFilter = "$domain:8081/scripts/filter";
  static const String addScriptWatchList = "$domain:8081/watchlist/add";
  static const String trade = "$domain:8081/trade";
  static const String order = "$domain:8081/order";
  static const String tradeActivePosition = "$domain:8081/trade/active-positions";

  /// trades

  static const String orderFilter = "$domain:8081/order/filter";
  static const String tradeFilter = "$domain:8081/trade/filter";
  static const String orderCancel = "$domain:8081/order/cancel/";

  /// leaderboard

  static const String leaderboard = "$domain:8081/leaderboard";
  static const String rankApi = "$domain:8081/rank/slabs/";
  static const String remove_or_update_sequence = "$domain:8081/watchlist/remove-or-update-sequence";
  static const String archiveFilter = "$domain:8081/archive/filter";

  /// profile
  static const String profile = "$domain:8081/profile";
  static const String logout = "$domain:8081/logout";
  static const String updatePin = "$domain:8081/profile/update-pin";

}
