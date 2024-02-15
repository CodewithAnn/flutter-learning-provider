abstract class BaseApiServices {
  // abstract method for get the  Get method for the Api call
  Future<dynamic> getGetApiResponse(String url);

  // abstract method for get the POST method for the Api call

  Future<dynamic> getPostApiResponse(String url,dynamic data);
}
