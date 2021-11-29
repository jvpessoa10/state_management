import 'package:flutter/material.dart';

class MyHomePage2 extends StatelessWidget {

  final String title;

  MyHomePage2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CounterContainer(
        child: Scaffold(
          appBar: AppBar(
            title: Text("$title"),
          ),
          body: Center(
            child: CounterViewer(),
          ),
          floatingActionButton: CounterIncrementerFAB()
        )
    );
  }
}

class CounterIncrementerFAB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CounterContainerState state = CounterContainer.of(context);

    return FloatingActionButton(
      onPressed: () {state.incrementCounter();},
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
        Text(
          '${CounterContainer.of(context).counter}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}

class CounterContainer extends StatefulWidget {
  final Widget child;

  const CounterContainer({Key? key, required this.child}) : super(key: key);

  static CounterContainerState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCounter>()!.state;
  }

  @override
  CounterContainerState createState() => CounterContainerState();
}

class CounterContainerState extends State<CounterContainer> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
        state: this,
        child: this.widget.child
    );
  }
}

class InheritedCounter extends InheritedWidget {
  final CounterContainerState state;
  final Widget child;

  const InheritedCounter({
    Key? key,
    required this.state,
    required this.child
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) {
    return true;
  }
}

