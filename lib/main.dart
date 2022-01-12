import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers/provider_pages/future_provider_page.dart';
import 'package:riverpod_providers/provider_pages/provider_page.dart';
import 'package:riverpod_providers/provider_pages/state_provider_page.dart';
import 'package:riverpod_providers/provider_pages/stream_provider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RiverPod Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Riverpod Providers"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
              child: const ProviderCards(),
            ))
    );
  }
}

class ProviderCards extends StatelessWidget {
  const ProviderCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildCard(String provider, Widget page) {
      return Card(
        color: Colors.blue,
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          },
          child: Center(
              child: Text(provider)
          ),
        ),
      );
    }

    return Column(
      children: [
        Container(
         // width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric( vertical: 30.0, horizontal: 5.0),
          child: Text("This app is a simple demonstration of the different Provider categories of the Riverpod State Provider", style: TextStyle(fontSize: 18.0,wordSpacing: 2.0)),
        ),

        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              buildCard("Provider", ProviderPage()),
              buildCard("State Provider", StateProviderPage()),
              buildCard("Future Provider", FutureProviderPage()),
              buildCard("Stream Provider",  StreamProviderPage()),
            ],


          ),
        ),
      ],
    );

  }

}

