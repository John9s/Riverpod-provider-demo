import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final stringProvider = Provider<String> ((ref) => "Provider Page");

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider page"),
      ),
      body: Container(
        child: Center(
          child: Consumer(
            builder: (context, ref, child){
              final text = ref.watch(stringProvider);

              return  Text(text);

            },
          ),
        ),
      ),
    );
  }
}
