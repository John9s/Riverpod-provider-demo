import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final streamProvider = StreamProvider.autoDispose<String>((ref) => Stream.periodic(
  const Duration(seconds: 1),
    (count) => "$count"
));

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final stream = ref.watch(streamProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Stream Provider"),
        ),
        body: Center(child: stream.when(data: (data) => Text("The Current number is $data"), error: (e, stack) => Text("Error: $e"), loading: () => CircularProgressIndicator()))
    );
  }
}