import 'package:flutter/material.dart';
import 'package:flutter_10mei_http/api_service.dart';

void main() {
  getApi();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map datas = {};
  Future _fetchData() async {
    var data = await getApi();
    setState(() {
      datas = data['data'];
    });
    print(datas['thumbnail']);
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Card(
          child: datas.isNotEmpty
              ? Image.network(datas['thumbnail'])
              : CircularProgressIndicator(color: Colors.pink, backgroundColor: Colors.black,),
          // child: Image(image: 
          // AssetImage('assets/onepiece.jpg')),
        ),
      ),
    );
  }
}
