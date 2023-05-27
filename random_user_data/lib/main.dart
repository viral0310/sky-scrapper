import 'package:flutter/material.dart';
import 'package:random_user_data/model.dart';
import 'package:http/http.dart' as http;

import 'helper class.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.teal, secondary: Colors.teal)),
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextStyle myStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  bool isRefresh = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Random data",
          style: myStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isRefresh = !isRefresh;
                });
              },
              icon: const Icon(
                Icons.refresh,
                size: 30,
              ))
        ],
      ),
      body: FutureBuilder(
        future: DataApiHelper.dataApiHelper.fetchSinglePostData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            UserData? data = snapshot.data;
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage('${data!.lrg_image}'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Name : ${data.name_title} ${data.name_first} ${data.name_last}",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gender : ${data.gender} ",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email : ${data.email} ",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Phone : ${data.phone}",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Address : ${data.location_name},\n                  ${data.state},\n                  ${data.location_number}.",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Resident Country : ${data.country}",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "DOB : ${data.dob}",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Age : ${data.age}",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "PostCode : ${data.postcode}",
                    style: myStyle,
                  ),
                  const Spacer(),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      /*FutureBuilder(
        future: DataApiHelper.dataApiHelper.fetchUserData(),
        builder: (context, snapshot) {
          List<UserData>? data = snapshot.data;
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(title: Text("${data[i].age}")),
                );
              },
              itemCount: data!.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),*/
    );
  }
}
/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => UserList(),
        '/detail': (context) => DetailPage(),
      },
    ));

class UserList extends StatelessWidget {
  final String apiUrl = "https://randomuser.me/api/?results=5";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed('/detail',
                                  arguments: snapshot.data[index]);
                            },
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    snapshot.data[index]['picture']['large'])),
                            title: Text(_name(snapshot.data[index])),
                            subtitle: Text(_location(snapshot.data[index])),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}*/
