import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:maveli_mart/data/models/flower_list_response.dart';
import '../../../data/urls/api_urls.dart';

class FlowerListRespository {
  static Future<Either<String, FlowerListResponseModel>> flowerListApiCall() async {
    try {
      Uri apiUri = Uri.parse(APIUrls.baseUrl + APIUrls.flowerListSlug);

      final apiResponse = await http.get(
        apiUri,
        headers: {"Content-Type": "application/json"},
      );

      final apiResponseModal = flowerListResponseModelFromJson(apiResponse.body);

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
