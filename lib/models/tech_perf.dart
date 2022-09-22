class TechPerf {
  String id;
  String label;
  String chartPeriodCode;
  double? changePercent;
  TechPerf(
      {required this.id,
      required this.label,
      required this.chartPeriodCode,
      required this.changePercent});
  factory TechPerf.fromJson(Map<String, dynamic> json) => TechPerf(
        id: json["ID"].toString(),
        label: json["Label"],
        chartPeriodCode: json["ChartPeriodCode"],
        changePercent: json["ChangePercent"],
      );
}
