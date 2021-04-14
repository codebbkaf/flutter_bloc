import 'dart:async';
import 'package:flutter_app_bloc_kata_sec/counter_event.dart';

class CounterBloc {
  int _counter;

  // for state output
  final StreamController _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  // for event input
  final StreamController _counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc(){
    _counterEventController.stream.listen((event) {
      if (event is IncrementEvent){
        _counter++;
      } else {
        _counter--;
      }
      _inCounter.add(_counter);
    });
  }

  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }



}