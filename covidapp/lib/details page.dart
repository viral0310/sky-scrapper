import 'package:flutter/material.dart';

import 'model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Model;
    return Scaffold(
      appBar: AppBar(
        title: Text('${args.country}'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 360,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.18,
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/3625655.jpg',
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Recovered : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${args.recovered}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      height: 360,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.18,
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/tested.jpg',
                            )),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Deceased : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${args.deceased}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 360,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.18,
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/12.jpg',
                            )),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Infected : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${args.infected}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      height: 360,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.18,
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/infected.jpg',
                            )),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Tested : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${args.tested}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
