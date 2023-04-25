import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/services/network/dto/job_dto.dart';

class JobsService {
  static const auth = 'secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ';
  static const baseUrl =
      'https://api.notion.com/v1/databases/283d2760f81548f0a7baca4b3e58d7d8/query';

  Future<List<JobDTO>> jobs(String date) async {
    final response = await http.post(
      Uri.https(baseUrl, auth),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        'Notion-Version': 'bb6682d2a6ca79ddd9e56a2d05bd0bad',
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return JobResponse.fromJson(decodedResponse).response;
  }
}