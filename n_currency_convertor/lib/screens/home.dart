import 'package:flutter/material.dart';

import '../helperes/currency_helper.dart';
import '../models/currency.dart';
import 'anyConvertor.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> name = ['EUR', 'USD'];
  TextEditingController EURController = TextEditingController();
  TextEditingController USDController = TextEditingController();
  String EURdropdownValue = 'EUR';
  String USDdropdownValue = 'USD';
  String EURanswer = 'Converted Currency will be shown here :)';
  String USDanswer = 'Converted Currency will be shown here :)';
  //---------------
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String answer = 'Converted Currency will be shown here :)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.3),
        child: Column(
          children: [
            /* Expanded(
              child: CurrentFunction(EURController, EURdropdownValue, EURanswer,
                  CurrencyAPHelper.currencyAPHelper.fetchUSDBaseData(), name[0]),
            ),*/

            Expanded(
              flex: 2,
              child: FutureBuilder(
                future: CurrencyAPHelper.currencyAPHelper.fetchUSDBaseData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    Currency? data = snapshot.data as Currency?;

                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 12, top: 18, right: 12),
                        margin: const EdgeInsets.all(8),
                        height: 210,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "EUR to Any Currency",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text(
                                  "Enter EUR",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              controller: EURController,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: EURdropdownValue,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_rounded),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        EURdropdownValue = val as String;
                                      });
                                    },
                                    items: data?.rates.keys
                                        .toSet()
                                        .toList()
                                        .map<DropdownMenuItem<String>>(
                                      (val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        EURanswer =
                                            '${EURController.text} USD = ${(data?.rates[EURdropdownValue] * int.parse(EURController.text)).toString().split('.').first} $EURdropdownValue';
                                      });
                                    },
                                    child: const Text(
                                      'Convert',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    /*style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),*/
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              EURanswer,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: FutureBuilder(
                future:
                    USDCurrencyAPHelper.USDcurrencyAPHelper.fetchUSDBaseData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    Currency? data = snapshot.data as Currency?;

                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 12, top: 18, right: 12),
                        margin: const EdgeInsets.all(8),
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "USD to Any Currency",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text(
                                  "Enter USD",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              controller: USDController,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: USDdropdownValue,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_rounded),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        USDdropdownValue = val as String;
                                      });
                                    },
                                    items: data?.rates.keys
                                        .toSet()
                                        .toList()
                                        .map<DropdownMenuItem<String>>(
                                      (val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        USDanswer =
                                            '${USDController.text} USD = ${(data?.rates[USDdropdownValue] * int.parse(USDController.text)).toString().split('.').first} $USDdropdownValue';
                                      });
                                    },
                                    child: const Text(
                                      'Convert',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    /*style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Theme.of(context).primaryColor)),*/
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                                child: Text(
                              USDanswer,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ))
                          ],
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            /* Expanded(
              child: CurrentFunction(
                USDController,
                USDdropdownValue,
                USDanswer,
                USDCurrencyAPHelper.USDcurrencyAPHelper.fetchUSDBaseData(),
                name[1],
              ),
            ),*/
            Expanded(
              flex: 2,
              child: FutureBuilder(
                future: CurrencyAPHelper.currencyAPHelper.fetchUSDBaseData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    Currency? data = snapshot.data;

                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 12, top: 18, right: 12),
                        margin: const EdgeInsets.all(8),
                        height: 320,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Enter Amount",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text(
                                  "Enter Amount",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              controller: amountController,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue1,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_rounded),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        dropdownValue1 = val!;
                                      });
                                    },
                                    items: data?.rates.keys
                                        .toSet()
                                        .toList()
                                        .map<DropdownMenuItem<String>>(
                                      (val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: const Text('To')),
                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue2,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_rounded),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        dropdownValue2 = val!;
                                      });
                                    },
                                    items: data?.rates.keys
                                        .toSet()
                                        .toList()
                                        .map<DropdownMenuItem<String>>(
                                      (val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    answer =
                                        '${amountController.text} $dropdownValue1 =  ${(num.parse(amountController.text) / data!.rates[dropdownValue1] * data.rates[dropdownValue2])} $dropdownValue2';
                                  });
                                  print(answer);
                                },
                                child: const Text(
                                  'Convert',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              answer,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // const AnyConvertor(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
/*
  CurrentFunction(TextEditingController controller, String dropdownvalue,
      String answer, Future<Currency?> method, String name) {
    return FutureBuilder(
      future:
          // USDCurrencyAPHelper.USDcurrencyAPHelper.fetchUSDBaseData(),
          method,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          Currency? data = snapshot.data as Currency?;

          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12, top: 18, right: 12),
                  margin: const EdgeInsets.all(8),
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$name to Any Currency",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Enter $name",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        controller: controller,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              value: dropdownvalue,
                              icon: const Icon(Icons.arrow_drop_down_rounded),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              underline: Container(
                                height: 1,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  dropdownvalue = val as String;
                                });
                              },
                              items: data?.rates.keys
                                  .toSet()
                                  .toList()
                                  .map<DropdownMenuItem<String>>(
                                (val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  answer =
                                      '${controller.text} USD = ${(data?.rates[dropdownvalue] * double.parse(controller.text)).toStringAsFixed(2)} $dropdownvalue';
                                });
                              },
                              child: const Text(
                                'Convert',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              */ /*style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),*/ /*
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }*/
}
