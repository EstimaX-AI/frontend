import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://job-backend-a8xe.onrender.com";

  static Future<Map<String, dynamic>> uploadBlueprint(
      List<int> bytes,
      String fileName,
      ) async {
    print("Uploading file...");

    var request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/api/v1/jobs"),
    );

    request.fields["user_id"] = "dummy_user";

    request.files.add(
      http.MultipartFile.fromBytes("file", bytes, filename: fileName),
    );

    var response = await request.send();
    var body = await response.stream.bytesToString();

    print("UPLOAD RESPONSE:");
    print(body);

    var uploadData = jsonDecode(body);
    String jobId = uploadData["job_id"];

    print("JOB ID: $jobId");

    Map<String, dynamic>? resultData;

    int attempts = 0;

    while (attempts < 40) {
      await Future.delayed(const Duration(seconds: 3));
      attempts++;

      print("Checking result... Attempt: $attempts");

      var resultResponse = await http.get(
        Uri.parse("$baseUrl/api/v1/jobs/$jobId/result"),
      );

      print("RESULT STATUS CODE: ${resultResponse.statusCode}");
      print("RAW RESULT: ${resultResponse.body}");

      var decoded = jsonDecode(resultResponse.body);

      if (decoded["data"] != null) {
        String status = decoded["data"]["status"];
        print("JOB STATUS: $status");

        if (status == "COMPLETED") {
          resultData = decoded;
          break;
        }
      }

      print("Still processing...");
    }

    if (resultData == null) {
      print("Result not ready after max attempts");

      return {
        "total": 0,
        "elbow45": 0,
        "elbow90": 0,
        "returnAir": 0,
        "supplyAir": 0,
        "diffuser": 0,
      };
    }

    print("FINAL RESULT BODY:");
    print(resultData);

    var resultRaw = resultData["data"]["result"];

    Map<String, dynamic> parsed = resultRaw is String
        ? jsonDecode(resultRaw)
        : resultRaw;

    print("PARSED DATA:");
    print(parsed);

    int elbow45 = parsed["45 RADIUS ELBOW"] ?? 0;
    int elbow90 = parsed["90 RADIUS ELBOW"] ?? 0;
    int returnAir =
        parsed["RETURN-EXHAUST OR OUTSIDE AIR RISE"] ?? 0;
    int supplyAir = parsed["SUPPLY AIR RISE"] ?? 0;
    int diffuser = parsed["RETURN OR EXHAUST DIFFUSER"] ?? 0;

    int total = parsed.values.fold(0, (a, b) => a + (b as int));
    return {
      "total": total,
      "elbow45": elbow45,
      "elbow90": elbow90,
      "returnAir": returnAir, // fixed
      "supplyAir": supplyAir,
      "diffuser": diffuser,
    };
  }
}