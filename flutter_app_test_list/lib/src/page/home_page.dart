import 'package:flutter/material.dart';
import '../model/project_infor.dart';
import '../uicontrol/listview_itemcontrol.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

enum GroupEnum2 { Statistics, List, Library }
enum ProblemGroupEnum { Problem, Form, Mission }
enum InforSelectGroupEnum { Observe, Department, Day, Author }

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isOpenDrawer = false;
  String choseControl = 'chose';
  String valueListViewControl = 'dataProjectInforList';
  IconData problemIcon = Icons.adjust;
  String problemIconString = 'Vấn Đề';
  IconData staticIcon = Icons.equalizer;
  String staticIconString = 'Thống Kê';
  List<Choice> choicescheck = choices2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _closeDrawer() {
    setState(() {
      valueListViewControl = '';
    });
  }

  _setProblemIcon(IconData icon, String text) {
    setState(() {
      problemIcon = icon;
      problemIconString = text;
    });
  }

  _setStaticIcon(IconData icon, String text) {
    setState(() {
      staticIcon = icon;
      staticIconString = text;
    });
  }

  _getToggleChild() {
    setState(() {
      isOpenDrawer = !isOpenDrawer;
    });
    if (isOpenDrawer) {
      return _scaffoldKey.currentState.openDrawer();
    } else {
      if (context != null) {
        return Navigator.of(context).pop();
      } else {
        return _scaffoldKey.currentState.openDrawer();
      }
    }
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }

  _getListViewControl() {
    switch (valueListViewControl) {
      case 'dataProjectInforList':
        {
          return ListViewControl(projectInfor: dataProjectInforList);
        }
        break;

      case 'dataProjectInforDetaiList':
        {
          return ListViewDetailControl(
              projectInforDetail: dataProjectInforDetaiList);
        }
        break;

      default:
        {
          return ListViewControl(projectInfor: dataProjectInforList);
        }
        break;
    }
  }

  _getChoseControl() {
    switch (choseControl) {
      case 'chose':
        {
          return TabBarView(
            controller: _tabController,
            children: choices.map((Choice choice2) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice2),
              );
            }).toList(),
          );
        }
        break;

      case 'chose':
        {
          return TabBarView(
            controller: _tabController,
            children: choices.map((Choice choice3) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice3),
              );
            }).toList(),
          );
        }
        break;

      default:
        {
          return TabBarView(
            controller: _tabController,
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          );
        }
        break;
    }
  }

  _setListViewControl() {
    setState(() {
      isOpenDrawer = !isOpenDrawer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          'Demo project',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: new IconButton(
            icon: new Icon(
              Icons.dehaze,
              color: Colors.grey.shade500,
            ),
            onPressed: () {
              //_getToggleChild();
              _scaffoldKey.currentState.openDrawer();
            }),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/author');
              }),
          PopupMenuButton<GroupEnum2>(
            icon: new Icon(
              staticIcon,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<GroupEnum2>>[
                  PopupMenuItem<GroupEnum2>(
                    value: GroupEnum2.Statistics,
                    child: GestureDetector(
                      onTap: () {
                        _setStaticIcon(Icons.equalizer, 'Thống Kê');
                        Navigator.pop(context);
                      },
                      child: new Row(
                        children: [
                          new IconButton(icon: new Icon(Icons.equalizer)),
                          Text('Thống Kê')
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem<GroupEnum2>(
                    value: GroupEnum2.List,
                    child: GestureDetector(
                      onTap: () {
                        _setStaticIcon(Icons.list, 'Danh Sách');
                        Navigator.pop(context);
                      },
                      child: new Row(
                        children: [
                          new IconButton(icon: new Icon(Icons.list)),
                          Text('Danh Sách')
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem<GroupEnum2>(
                    value: GroupEnum2.Library,
                    child: GestureDetector(
                      onTap: () {
                        _setStaticIcon(Icons.image, 'Thư Viện Ảnh');
                        Navigator.pop(context);
                      },
                      child: new Row(
                        children: [
                          new IconButton(icon: new Icon(Icons.image)),
                          Text('Thư Viện Ảnh')
                        ],
                      ),
                    ),
                  ),
                ],
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: new Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(child: _getListViewControl()),
        body: _getChoseControl(),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PopupMenuButton<InforSelectGroupEnum>(
                icon: new Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<InforSelectGroupEnum>>[
                      PopupMenuItem<InforSelectGroupEnum>(
                        value: InforSelectGroupEnum.Observe,
                        child: new Row(
                          children: [
                            new IconButton(icon: new Icon(Icons.local_see)),
                            Text('Quan Sát')
                          ],
                        ),
                      ),
                      PopupMenuItem<InforSelectGroupEnum>(
                        value: InforSelectGroupEnum.Department,
                        child: new Row(
                          children: [
                            new IconButton(icon: new Icon(Icons.adjust)),
                            Text('Bang')
                          ],
                        ),
                      ),
                      PopupMenuItem<InforSelectGroupEnum>(
                        value: InforSelectGroupEnum.Day,
                        child: new Row(
                          children: [
                            new IconButton(icon: new Icon(Icons.today)),
                            Text('Ngày')
                          ],
                        ),
                      ),
                      PopupMenuItem<InforSelectGroupEnum>(
                        value: InforSelectGroupEnum.Author,
                        child: new Row(
                          children: [
                            new IconButton(icon: new Icon(Icons.portrait)),
                            Text('Tác Giả')
                          ],
                        ),
                      ),
                    ],
              ),
              PopupMenuButton<ProblemGroupEnum>(
                child: new Row(
                  children: [
                    new IconButton(icon: new Icon(problemIcon)),
                    Text(problemIconString)
                  ],
                ),
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<ProblemGroupEnum>>[
                      PopupMenuItem<ProblemGroupEnum>(
                        value: ProblemGroupEnum.Problem,
                        child: GestureDetector(
                          onTap: () {
                            _setProblemIcon(Icons.adjust, 'Vấn Đề');
                            Navigator.pop(context);
                          },
                          child: new Row(
                            children: [
                              new IconButton(icon: new Icon(Icons.adjust)),
                              Text('Vấn Đề'),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem<ProblemGroupEnum>(
                        value: ProblemGroupEnum.Form,
                        child: GestureDetector(
                          onTap: () {
                            _setProblemIcon(Icons.web_asset, 'Mẫu');
                            Navigator.pop(context);
                          },
                          child: new Row(
                            children: [
                              new IconButton(icon: new Icon(Icons.web_asset)),
                              Text('Mẫu')
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem<ProblemGroupEnum>(
                        value: ProblemGroupEnum.Mission,
                        child: GestureDetector(
                          onTap: () {
                            _setProblemIcon(Icons.place, 'Nhiệm vụ');
                            Navigator.pop(context);
                          },
                          child: new Row(
                            children: [
                              new IconButton(icon: new Icon(Icons.place)),
                              Text('Nhiệm vụ')
                            ],
                          ),
                        ),
                      ),
                    ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/tool');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

const List<Choice> choices2 = const <Choice>[
  const Choice(title: 'CAR2', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE2', icon: Icons.directions_bike),
  const Choice(title: 'BOAT2', icon: Icons.directions_boat),
  const Choice(title: 'BUS2', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN2', icon: Icons.directions_railway),
  const Choice(title: 'WALK2', icon: Icons.directions_walk),
];

const List<Choice> choices3 = const <Choice>[
  const Choice(title: 'CAR3', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE3', icon: Icons.directions_bike),
  const Choice(title: 'BOAT3', icon: Icons.directions_boat),
  const Choice(title: 'BUS3', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN3', icon: Icons.directions_railway),
  const Choice(title: 'WALK3', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
