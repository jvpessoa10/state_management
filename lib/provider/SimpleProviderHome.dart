import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/Counter.dart';

class SimpleProviderHome extends StatelessWidget {

  final String title;

  const SimpleProviderHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
        create: (BuildContext context) => Counter(3),
        child: Scaffold(
            appBar: AppBar(
              title: Text("$title"),
            ),
            body: Center(
              child: CounterViewer(),
            )
        ),
    );
  }
}


class CounterViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Consumer<Counter>(
          builder: (context, counter, child) => Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headline4,
          ),
        )
      ],
    );
  }
}