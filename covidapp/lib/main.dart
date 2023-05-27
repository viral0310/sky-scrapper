import 'package:covidapp/helper.dart';
import 'package:flutter/material.dart';

import 'details page.dart';
import 'model.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.green.withOpacity(0.2))),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyApp(),
        '/detail': (context) => DetailsPage(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corona Analysis'),
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchMultiplePostData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Model>? data = snapshot.data as List<Model>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/detail', arguments: data[i]);
                    },
                    title: Text('${data[i].country}'),
                    leading: Text("${i + 1}"),
                    trailing: (data[i].deceased != null)
                        ? Text("${data[i].deceased}")
                        : const Text("0"),
                    // subtitle: Text(data[i].body),
                    // trailing: Text("${data[i].id}"),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
