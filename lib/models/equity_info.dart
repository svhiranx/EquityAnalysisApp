import 'dart:convert';

class EquityInfo {
  var id;
  String? industry;
  String? sector;
  double? marketCap;
  double? ev;
  double? share;
  double? pe;
  double? pegRatio;
  double? dividendYield;
  EquityInfo({
    required this.id,
    required this.sector,
    required this.industry,
    required this.marketCap,
    required this.ev,
    required this.share,
    required this.pe,
    required this.pegRatio,
    required this.dividendYield,
  });
  factory EquityInfo.fromJson(Map<String, dynamic> json) => EquityInfo(
      id: json["ID"],
      sector: json["Sector"],
      industry: json["Industry"],
      marketCap: json["MCAP"],
      ev: json["EV"],
      share: json["BookNavPerShare"],
      pe: json["TTMPE"],
      pegRatio: json["PEGRatio"],
      dividendYield: json["Yield"]);

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Sector": sector,
        "Industry": industry,
        "MCAP": marketCap,
        "EV": ev,
        "BookNavPerShare": share,
        "TTMPE": pe,
        "PEGRatio": pegRatio,
        "Yield": dividendYield,
      };
}
