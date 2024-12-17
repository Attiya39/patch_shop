abstract class BaseApiService {
  // Abstract Base Class

  // Contains "abstract functions", which must have to override by those classes, which inherit
  // from this abstract base class.
  Future getGetApiResponse(
    String url, {
    Map<String, dynamic>? headers,
  });
  Future getPostApiResponse(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
  });

  Future getPutApiResponse(
      String url,
      dynamic data, {
        Map<String, dynamic>? headers,
      });

  Future getDeleteApiResponse(
      String url, {
        Map<String, dynamic>? headers,
      });

  // Future getMultipartPostApiResponse(
  //     String url,
  //     Map<String, dynamic> data, {
  //       Map<String, String>? headers,
  //     });

  // Future getPostApiResponseWithStatusCode(
  //     String url,
  //     dynamic data, {
  //       Map<String, dynamic>? headers,
  //     });
}
