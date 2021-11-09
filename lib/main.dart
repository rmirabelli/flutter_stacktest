import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TabInfo {
  Tab tab;
  Widget widget;

  TabInfo(this.tab, this.widget);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tabInfos = [
    TabInfo(
      Tab(
        icon: Icon(Icons.access_alarms),
        text: 'A',
      ),
      Text('screen A'),
    ),
    TabInfo(
      Tab(
        icon: Icon(Icons.bakery_dining),
        text: 'B',
      ),
      Text('screen B'),
    ),
    TabInfo(
      Tab(
        icon: Icon(Icons.cell_wifi),
        text: 'C',
      ),
      Text('screen C'),
    ),
    TabInfo(
      Tab(
        icon: Icon(Icons.deck),
        text: 'D',
      ),
      Text('screen D'),
    ),
  ];

  void _showSnackbar() {
    final snackBar = SnackBar(
      content: Text("It's early for a snack"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabInfos.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: Container(
          color: Colors.blueGrey,
          child: TabBar(tabs: tabInfos.map((e) => e.tab).toList()),
        ),
        body: TabBarView(
          children: tabInfos.map((e) => e.widget).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showSnackbar,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
