import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounterState(
        counter: _counter,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: CounterViewer(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        )
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
        Text(
          '${InheritedCounterState.of(context)!.counter}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}

class InheritedCounterState extends InheritedWidget {
  final int counter;

  const InheritedCounterState({
    Key? key,
    required this.counter,
    required Widget child
  }): super(key: key, child: child);

  static InheritedCounterState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCounterState>();
  }

  @override
  bool updateShouldNotify(covariant InheritedCounterState oldWidget) {
    return oldWidget.counter != counter;
  }
}