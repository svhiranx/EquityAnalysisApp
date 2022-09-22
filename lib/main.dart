import 'package:flutter/material.dart';
import 'package:paprclip_task/widgets/bar_entry.dart';
import 'package:paprclip_task/widgets/chartbar.dart';
import 'package:paprclip_task/widgets/list_entry.dart';
import 'package:paprclip_task/models/equity_info.dart';
import 'package:paprclip_task/models/tech_perf.dart';
import 'apiservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equity Analysis',
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),
            headline1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(51, 73, 115, 1))),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Equity Analysis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  EquityInfo? _equityInfo;
  List<TechPerf?>? _techPerf;
  @override
  void initState() {
    super.initState();
    _fetchEquity();
    _fetchTech();
  }

  void _fetchEquity() async {
    _equityInfo = (await ApiService().getEquityInfo())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _fetchTech() async {
    _techPerf = (await ApiService().getPerformance())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  String toFixed(var val) {
    if (val == null) return '-';
    return val.toStringAsFixed(2);
  }

  String? numDifferentiation(double? val) {
    if (val == null) return '-';

    if (val >= 10000000) {
      return toFixed(val / 10000000) + ' Cr';
    } else if (val >= 100000) {
      return toFixed(val / 10000000) + ' Lac';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(51, 73, 115, 1),
      ),
      body: _equityInfo == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Overview',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Divider(
                      thickness: 2,
                      indent: width * 0.02,
                      endIndent: width * 0.02),
                  ListEntry(name: 'Sector', value: _equityInfo?.sector),
                  ListEntry(name: 'Industry', value: _equityInfo?.industry),
                  ListEntry(
                      name: 'Market Cap.',
                      value: numDifferentiation(_equityInfo?.marketCap)),
                  ListEntry(
                      name: 'Enterprise Value (EV)',
                      value: toFixed(_equityInfo!.ev)),
                  ListEntry(
                      name: 'Book Value/Share',
                      value: toFixed(_equityInfo!.share)),
                  ListEntry(
                      name: 'Price-Earning Ratio (PE)',
                      value: toFixed(_equityInfo!.pe)),
                  ListEntry(
                      name: 'PEG Ratio', value: toFixed(_equityInfo!.pegRatio)),
                  ListEntry(
                      name: 'Dividend Yield',
                      value: toFixed(_equityInfo!.dividendYield)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Performance',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Divider(
                      thickness: 2,
                      indent: width * 0.02,
                      endIndent: width * 0.02),
                  ..._techPerf!.map((e) => BarEntry(e!))
                ],
              ),
            ),
    );
  }
}
