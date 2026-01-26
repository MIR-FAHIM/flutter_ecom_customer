//155 api

import 'package:ecom_delivery_flutter/app/api_providers/company_data.dart';

class ApiClient {
  static const String baseUrl = CompanyData.baseUrl;


  static const String login = '$baseUrl/api/auth/login';
  static const String changeNotificationStatus =
      '${baseUrl}/api/appapi/myNotifications/changeStatus';

  static const String getProfile = '$baseUrl/api/get-profile?user_id=';

}
