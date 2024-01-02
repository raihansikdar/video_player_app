class Urls{
  Urls._();
  static const String _baseUrl = "https://test-ximit.mahfil.net/api";
  static String trendingVideo({required int pageNo}) => "$_baseUrl/trending-video/1?page=$pageNo";
}