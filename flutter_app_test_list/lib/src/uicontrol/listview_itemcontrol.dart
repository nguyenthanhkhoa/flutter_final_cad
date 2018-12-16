import 'package:flutter/material.dart';
import '../model/project_infor.dart';
import '../page/tool_page.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListViewControl extends StatelessWidget {
  final List<ProjectInfor> projectInfor;

  ListViewControl({Key key, @required this.projectInfor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projectInfor.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/tool');
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 10,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${projectInfor[index].title}'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('${projectInfor[index].number}'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                new Divider(
                  height: 15.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class ListViewDetailControl extends StatelessWidget {
  final List<ProjectInforDetail> projectInforDetail;

  ListViewDetailControl({Key key, @required this.projectInforDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projectInforDetail.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

            Navigator.of(context).pushNamed('/tool');
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 10,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${projectInforDetail[index].title}'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                new Divider(
                  height: 15.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
