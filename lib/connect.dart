import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Employee> fetchEmployee() async {
  final response = await http
      .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));

  if (response.statusCode == 200) {
    return Employee.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load employee');
  }
}

class Employee {
  final int? id;
  final String? name;
  final int? salary;
  final int? age;
  var image;

  Employee({
    this.id,
    this.name,
    this.salary,
    this.age,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['employee_name'],
      salary: json['employee_salary'],
      age: json['employee_age'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Employee> futureEmployee;

  @override
  void initState() {
    super.initState();
    futureEmployee = fetchEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data'),
        ),
        body: Center(
          child: FutureBuilder<Employee>(
            future: futureEmployee,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data!.name);
                return Text('sucess');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
