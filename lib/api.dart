import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// ...............................................

class Api {

// Local
  static String authorizationBearerKey = '';
  static const String serverUrl = 'https://192.168.1.18/api/v1';

// SnipeIT demo server
// const serverUrl = 'https://develop.snipeitapp.com/api/v1';
// const authorizationBearerKey = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTU2MDc0MjVmYjM5YTEwYjFjNTZlZTAxMTBmZDk4ZjQ0ZjVjODMzYjcxZWVhYjZlNDk1NGMwOThlY2YzMzU2MDY4Mzg4MmFhMDMzOTAzNzciLCJpYXQiOjE2MzI4NjU5MTgsIm5iZiI6MTYzMjg2NTkxOCwiZXhwIjoyMjY0MDIxNTE4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LgGVzyH67IRhXvccHd4j2Dn6TDuIuQTBoo30_wD9jPehy8v_h0xBmE1-dOUBRJyeJOI8B4gwPeALsWaudpGj9Lb5qWAtKV7eYtH9IYQKoLF_iHgOGXnAUcNwID6zBU_YyLNSI6gp8zjutLJias33CBLsHy5ZRNpxVibVrZouJ_HjYuIYbtZyLus-KFFeibtZoPiTWOeHhQFD37MR6ifx4dBqT37fN-xDS99mONtrkAplEIou5aSO1oZ4IlJIPCUyA1lixPgpn1YU7PxiBDZp1teeugD0WEmrAqxRS2I0bH4qPsuTsrVXS_lo87Sf5LBGLW7lGHKqyYH6J47OZOM0K-SrxLKtE1ww8jyLBgnnxH0lJHRLCBiwUnL5ZGTUmiOysUA-wSJ6s78o8Pc-ec6bpBvAlelHdiQ-wslE7gzEJDptbejFg-75b_CEwgJYh7J2D18ul6Qu5EFCUEgt033mm04dgVk0isWTDt6EW5ZvTo5Qhr1LY0YnEIXCTqIRN-BSQjL55sZaCrtwR_21bnBGgniyI5MRDYblFawVmFKroeClCpSjBo9vi66akdD5hjpvx67RL3r33BZQhEXmPifUPNH5wP_U-IHGFUD99TJk2c1awF0RASveZRLSunbJb1x6hGAVUaIvQV4r2quWzXqYyKLph9kGTyJYrb6iJtH5smE';

  static String urlUsersMe()  => '$serverUrl/users/me';
  static String urlUserAssets(String userId) => '$serverUrl/users/$userId/assets';
  static String urlUserLicenses(String userId) => '$serverUrl/users/$userId/licenses';
  static String urlUserAccessories(String userId) => '$serverUrl/users/$userId/accessories';
  static String urlAmmoStock()  => '$serverUrl/consumables';

  // Función que crea el objeto DIO que permite hacer conexiones HTTP.GET a la REST API. 
  // Para facilitar hacer las pruebas locales (servidor con "allow self-signed certificate")
  // esta función "confía" en cualquier "self-signed certificate".
  static Dio createDio({required String baseUrl, bool trustSelfSigned = false}) {
    final dio = Dio()
      ..options.baseUrl = baseUrl;

    // allow self-signed certificate
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => trustSelfSigned;
      return client;
    };

    return dio;
  }

}
