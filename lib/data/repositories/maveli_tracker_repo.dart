import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:maveli_mart/data/models/maveli_tracker_response.dart';
import '../../../data/urls/api_urls.dart';

class MaveliTrackerRespository {
  static Future<Either<String, MaveliTrackerModel>> maveliTrackApiCall() async {
    try {
      Uri apiUri = Uri.parse(APIUrls.baseUrl + APIUrls.maveliTrackerSlug);

      final apiResponse = await http.get(
        apiUri,
        headers: {"Content-Type": "application/json"},
      );

      final apiResponseModal = maveliTrackerModelFromJson(apiResponse.body);

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
