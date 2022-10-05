import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'package:http/http.dart' as http;

class MarketStackWidget extends StatefulWidget {
  const MarketStackWidget({Key? key}) : super(key: key);

  @override
  State<MarketStackWidget> createState() => _MarketStackWidgetState();
}

class _MarketStackWidgetState extends State<MarketStackWidget> {
  Map? mapResponse;
  List? listofMarketStock;

  Future fetchMarketStock() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listofMarketStock = mapResponse!['data'];
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Api');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMarketStock();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity - 80,
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Row(children: [
              SizedBox(width: 20),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    height: double.infinity - 10,
                    width: double.infinity,
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(15),
                      color: Colors.blue,
                      height: double.infinity - 10,
                      width: 100,
                      alignment: Alignment.center,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.search),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            labelText: 'Search Company By Name',
                            hintText: 'Enter Company\'s Name'),
                      ))),
            ]),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  color: Colors.blue,
                  height: double.infinity - 10,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Flex(direction: Axis.horizontal, children: const [
                    Flexible(fit: FlexFit.tight, flex: 1, child: Text('Open')),
                    Flexible(fit: FlexFit.tight, flex: 1, child: Text('High')),
                    Flexible(fit: FlexFit.tight, flex: 1, child: Text('Low')),
                    Flexible(fit: FlexFit.tight, flex: 1, child: Text('Close')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Volume')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Adj High')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Adj Low')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Adj Close')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Adj Open')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Adj Volume')),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Text('Split Factor')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Dividend')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Symbol')),
                    Flexible(
                        fit: FlexFit.tight, flex: 1, child: Text('Exchange')),
                    Flexible(fit: FlexFit.tight, flex: 1, child: Text('Date')),
                  ]))),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount:
                  listofMarketStock == null ? 0 : listofMarketStock!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(15),
                  color: Colors.blue,
                  child: ListTile(
                    title: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(
                                listofMarketStock![index]['open'].toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(
                                listofMarketStock![index]['high'].toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(
                                listofMarketStock![index]['low'].toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(
                                listofMarketStock![index]['close'].toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['volume']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['adj_high']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['adj_low']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['adj_close']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['adj_open']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(listofMarketStock![index]['adj_volume']
                              .toString()),
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(listofMarketStock![index]['split_factor']
                              .toString()),
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['dividend']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['symbol']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(listofMarketStock![index]['exchange']
                                .toString())),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text(
                                listofMarketStock![index]['date'].toString())),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ]));
  }
}
