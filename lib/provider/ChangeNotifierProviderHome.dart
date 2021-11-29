import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/Counter2.dart';

class ChangeNotifierProviderHome extends StatelessWidget {

  final String title;

  const ChangeNotifierProviderHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter2>(
        create: (BuildContext context) => Counter2(3),
        child: Scaffold(
            appBar: AppBar(
              title: Text("$title"),
            ),
            body: Center(
              child: CounterViewer(),
            ),
          floatingActionButton: CounterIncrementerFAB()
        ),
    );
  }
}

class CounterIncrementerFAB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Counter2 counter = Provider.of<Counter2>(context, listen: false);

    return FloatingActionButton(
      onPressed: () {counter.increment();},
      tooltip: 'Increment',
      child: Icon(Icons.add),
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
        Consumer<Counter2>(
          builder: (context, counter, child) => Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headline4,
          ),
        )
      ],
    );
  }
}