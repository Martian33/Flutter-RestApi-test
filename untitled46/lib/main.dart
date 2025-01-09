import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Əli abinin göndərdiyi məlumat',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('API Sorğusu'),
        ),
        body: const Center(
          child: FetchDataWidget(),
        ),
      ),
    );
  }
}

class FetchDataWidget extends StatefulWidget {
  const FetchDataWidget({super.key});

  @override
  _FetchDataWidgetState createState() => _FetchDataWidgetState();
}

class _FetchDataWidgetState extends State<FetchDataWidget> {
  String? data;

  Future<void> fetchData() async {
    var dio = Dio();
    var url = 'https://jsonplaceholder.typicode.com/todos/1';

    var response = await dio.get(url);
    setState(() {
      data = response.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        data != null
            ? Text(data!)
            : const Text('Məlumat Tapmadım'),
        ElevatedButton(
          onPressed: fetchData,
          child: const Text('Məlumatı Gətir'),
        ),
      ],
    );
  }
}
