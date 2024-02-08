import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 202, 137, 252)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<EXPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    var chartData = getChartData();
    _chartData = chartData;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          'Batuaa',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 214, 165, 252),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 214, 165, 252),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromARGB(255, 72, 71, 71),
              gap: 8,
              padding: EdgeInsets.all(11.0),
              tabs: [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.wallet, text: 'Wallet'),
                GButton(icon: Icons.verified_user_outlined, text: 'profile')
              ]),
        ),
      ),

      body: SfCircularChart(
        //List<Color> palette = const <Color>[Color.fromRGBO(75, 135, 185, 1),Color.fromRGBO(75, 135, 185, 1),Color.fromRGBO(75, 135, 185, 1),Color.fromRGBO(75, 135, 185, 1),Color.fromRGBO(75, 135, 185, 1),Color.fromRGBO(75, 135, 185, 1)],
        borderColor: Color.fromARGB(255, 214, 30, 242),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<EXPData, String>(
            dataSource: _chartData,
            xValueMapper: (EXPData data, _) => data.expense,
            yValueMapper: (EXPData data, _) => data.rupee,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Color> colorList = [
    Color.fromARGB(255, 237, 185, 245),
    Color.fromARGB(255, 232, 116, 250),
    Color.fromARGB(255, 181, 130, 189),
    Color.fromARGB(255, 238, 154, 251),
    Color.fromARGB(255, 244, 217, 248),
    Color.fromARGB(255, 234, 116, 252),
    Color.fromARGB(255, 237, 185, 245),
  ];

  List<EXPData> getChartData() {
    final List<EXPData> chartData = [
      EXPData('Food', 50000),
      EXPData('Travel', 20000),
      EXPData('Clothing', 40000),
      EXPData('Bills', 60000),
      EXPData('Studies', 10000),
      EXPData('Miscellenous', 5000),
    ];
    return chartData;
  }
}

class EXPData {
  EXPData(this.expense, this.rupee);
  final String expense;
  final int rupee;
}
