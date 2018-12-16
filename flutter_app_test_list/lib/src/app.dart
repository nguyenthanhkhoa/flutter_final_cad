import 'package:flutter/material.dart';
import 'page/home_page.dart';
import 'page/tool_page.dart';
import 'model/project_infor.dart';
import 'uicontrol/listview_itemcontrol.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: new MyApp(projectInforDetail: dataProjectInforList),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        //'/home': (BuildContext context) => new MyHomePage(),
        //'/detail': (BuildContext context) => new DetailPage(),
        '/tool': (BuildContext context) => new ToolPage(),
        //'/author': (BuildContext context) => new AuthorPage(),
        //'/contact': (BuildContext context) => new ContactPage(),
      },
    );
  }
}
