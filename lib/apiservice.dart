import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paprclip_task/models/tech_perf.dart';
import 'models/equity_info.dart';
import 'models/tech_perf.dart';

class ApiService {
  static String baseUrl = 'https://api.stockedge.com/Api/SecurityDashboardApi';

  static String equityEndpoint =
      '/GetCompanyEquityInfoForSecurity/5051?lang=en';

  static String perfEndpoint =
      '/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en';

  Future<EquityInfo?> getEquityInfo() async {
    var url = Uri.parse(baseUrl + equityEndpoint);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return EquityInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }

  Future<List<TechPerf?>?> getPerformance() async {
    var url = Uri.parse(baseUrl + perfEndpoint);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return List<TechPerf>.from(
          jsonDecode(response.body).map((x) => TechPerf.fromJson(x)));
    } else {
      throw Exception('failed');
    }
  }
}
