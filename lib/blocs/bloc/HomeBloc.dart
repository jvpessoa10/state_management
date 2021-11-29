import 'dart:async';
import 'package:inherited_widget_example/blocs/model/Counter.dart';
import 'Bloc.dart';

class HomeBloc extends Bloc {
  Counter _counter;

  final _counterController = StreamController<Counter>();

  Stream<Counter> get counterStream => _counterController.stream;

  HomeBloc(this._counter) {
   _counterController.sink.add(_counter);
  }

  void increment() async {
    Counter newCounter = await Future.delayed(
      Duration(seconds: 2),
        ()  {
          _counter.increment();
          return Counter(_counter.value);
        }
    );
    print(newCounter.value);
    _counterController.sink.add(newCounter);
  }

  @override
  void dispose() {
    _counterController.close();
  }
}