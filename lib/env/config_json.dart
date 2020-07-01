class ConfigJson{


  static const Map dev_config = {
    "env": "dev",
    "debug": true,
    "api_host":"www.develop.com",
    "app_name":"Summer_Debug",
    "app_icon":"icon_url_debug"
  };

  static const Map prod_config = {
    "env": "prod",
    "debug": false,
    "api_host":"www.production.com",
    "app_name":"Summer_Production",
    "app_icon":"icon_url_production"
  };

}