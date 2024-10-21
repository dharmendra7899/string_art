// ignore_for_file: non_constant_identifier_names

class Config {
  String get BASE_URL => 'https://api.closetobuy.com/api';

  String get LOGIN_URL => '/login-user?type=CUSTOMER';

  String get REGISTER_URL => '/register-customer-vendor?type=CUSTOMER';
}

final appUrls = Config();
