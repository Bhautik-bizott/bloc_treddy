import 'dart:convert';

import '../../../constant/app_apis.dart';
import '../../../data/api_function.dart';
import '../../../utils/enum.dart';
import '../../../utils/navigation_service.dart';

class AuthRepository {

  signUpAPI(userName, password) async {
    final response = await APIFunction().apiCall(
      context: NavigationService.navigatorKey.currentContext!,
      apiName: Apis.loginURL,
      method: APIMethods.POST,
      isLoading: true,
      withOutFormData: {"userName": userName, "password": password},
    );

    print("responseresponseresponseresponseresponse");
    print(jsonEncode(response));

  }


}