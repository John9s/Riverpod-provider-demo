import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<int> getCurrentYear() async{
 await Future.delayed(Duration(milliseconds: 600));

 return DateTime.now().year;
}

final futureProvider = FutureProvider.autoDispose((ref) => getCurrentYear());   //Using autoDispose to destroy the state when user exits the widget tree

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final future = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: Center(child: future.when(data: (data) => Text("The Current year is $data"), error: (e, stack) => Text("Error: $e"), loading: () => CircularProgressIndicator()))
    );
  }
}