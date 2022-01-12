import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final stateProvider = StateProvider.autoDispose<int>((ref) => 0);   //Using autoDispose to destroy the state when user exits the widget tree
class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final number = ref.watch(stateProvider).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
      ),
      body: Stack(
        children: [

          Container(
            height: double.infinity,
              child: Center(child: Text("The Fab has been clicked $number times"))),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.add),
                  onPressed: (){
                final counter = ref.watch(stateProvider.notifier);

                counter.state++;
              }),
            ),
          )
        ],
      ),
    );
  }
}