import 'dart:js';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(labelText: "Enter your name"),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Output(
                            data: controller.text,
                          )));
            },
            child: Text("Run"),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}

class Output extends StatelessWidget {
  String? data;
  Output({this.data});

  List<dynamic>? myLis = [];
  getData() {
    for (var i = 0; i < data!.length; i++) {
      int countt = 1;
      for (var j = i; j < data!.length - 1; j++) {
        if (data![i] == data![j + 1]) {
          countt = countt + 1;
        }
      }
      myLis!.add(DataList(name: data![i], count: countt));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Output"),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snap) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    itemCount: myLis!.length,
                    itemBuilder: (context, index) {
                      return myLis![index];
                    }),
              );
            }));
    //  Text("data")
  }
}

class DataList extends StatelessWidget {
  String? name;
  int? count;
  DataList({this.name, this.count});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name!),
        SizedBox(
          width: 5,
        ),
        Text(count.toString())
      ],
    );
  }
}
