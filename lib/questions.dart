import 'package:flutter/material.dart';
import 'package:flutter1/mysql.dart';
import 'package:http/http.dart' as http;

import './question.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var db = new Mysql();
  var indeks = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print(_questionIndex);
    db.getConnection().then((conn) {
      String sql = 'select indeks from student where id=1';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            indeks = row[0];
          });
        }
      });
    });
    print(indeks);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'Question 1',
      'Question 2',
      'Question 3',
      'Question 4',
      'Question 5'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Demo'),
          backgroundColor: Colors.indigo,
        ),
        body: Column(children: [
          Question(questions[_questionIndex]),
          ElevatedButton(
            child: Text('Answer 1'),
            onPressed: _answerQuestion,
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
            ),
          ),
          ElevatedButton(
            child: Text('Answer 2'),
            onPressed: () => print("Answer 2 chosen"),
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
            ),
          ),
          ElevatedButton(
            child: Text('Answer 3'),
            onPressed: () => {print('Answer 3:'), print('chosen')},
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
            ),
          ),
          ElevatedButton(
            child: Text('Go to next page'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomWords()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
            ),
          ),
        ]),
      ),
    );
  }
}
