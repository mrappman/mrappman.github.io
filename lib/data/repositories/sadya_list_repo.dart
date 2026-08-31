import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:maveli_mart/data/models/sadya_list_response.dart';
import '../../../data/urls/api_urls.dart';

class SadyaListRespository {
  static Future<Either<String, List<SadyaListResponseModel>>> sadyaListApiCall() async {
    try {
      Uri apiUri = Uri.parse(APIUrls.baseUrl + APIUrls.sadyaListSlug);

      final apiResponse = await http.get(
        apiUri,
        headers: {"Content-Type": "application/json"},
      );

      final apiResponseModal = sadyaListResponseModelFromJson(apiResponse.body);

      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
        return right(apiResponseModal);
      } else {
        return left(apiResponse.reasonPhrase ?? "Data unavailable. Please try again later.");
      }
    } on SocketException catch (error) {
      return left(error.toString());
    } on TimeoutException catch (error) {
      return left(error.toString());
    } on HttpException catch (error) {
      return left(error.toString());
    } on Exception catch (error) {
      return left(error.toString());
    } catch (error) {
      return left(error.toString());
    }
  }
}
