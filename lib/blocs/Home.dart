import 'package:flutter/material.dart';
import 'package:inherited_widget_example/blocs/bloc/HomeBloc.dart';
import 'package:provider/provider.dart';

import 'model/Counter.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _initialCounter = Counter(2);
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(_initialCounter);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Counter>(
      initialData: _initialCounter,
      create: (context) => _homeBloc.counterStream,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Bloc Home"),
          ),
          body: Center(
            child: CounterViewer(),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {_homeBloc.increment();},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.dispose();
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