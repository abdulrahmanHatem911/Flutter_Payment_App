import 'package:dio/dio.dart';
import 'package:payment/core/network/constant.dart';

//Authentication Request ==>  https://accept.paymob.com/api/auth/tokens
//Order Registration API ==> : https://accept.paymob.com/api/ecommerce/orders
// Payment Key Request ==>  https://accept.paymob.com/api/acceptance/payment_keys
class DioHelperPayment {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiContest.baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // to get data from url
  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }

  // post data
  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    return await dio.post(url, data: data, queryParameters: query);
  }
}
