import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:mvvm/data/network/networkApiServices.dart';
import 'package:mvvm/res/components/app_endpoints.dart';

class AuthRepo {
  BaseApiServices _apiServices = NetworkApiResponse();

  Future<dynamic> login(dynamic data) async {
    dynamic user =
        await _apiServices.getPostApiResponse(AppEndPoint.LoginEndPoint, data);
    try {} catch (e) {
      throw e;
    }
  }
}
