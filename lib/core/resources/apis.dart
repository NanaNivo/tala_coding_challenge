class ApiUrls {
  //static String get _baseUrl => 'https://stg.ivoryfashions.com/api/';

 // static String get _baseUrl => 'http://192.168.0.171:8001/api/';

  //static String get _baseUrl => 'http://192.168.0.171:8001/api/';

  //static String get _baseUrl => 'http://192.168.0.169:8001/api/';

   static String get baseUrl => 'https://dev.backend.svcore.garonzlab.com/api/';
   static String get imageUrl => 'https://dev.backend.svcore.garonzlab.com';
  static String get setAppInfo => '${baseUrl}app-info';

  static String get getCurrencies => '${baseUrl}currencies';

  static String get changeCurrency => '${baseUrl}change-currency';

  static String get getSlider => '${baseUrl}sliders?';
   static String get getTags => '${baseUrl}tags?';
   static String get getVisualSitting => '${baseUrl}visual-settings?';
   static String get getProducts=>'${baseUrl}products?';
   static String get getProductsDetiel=>'${baseUrl}products';


}
