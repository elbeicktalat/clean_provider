import 'package:clean_provider/clean_provider.dart';
import 'package:flutter/material.dart';

class CounterViewModel extends ViewModel {
  int get counter => _counter.value;
  final ValueNotifier<int> _counter = 0.listen;

  void increment() => _counter.value++;

  void decrement() => _counter.value--;

  @override
  List<ChangeNotifier> get notifiers => <ChangeNotifier>[
        _counter,
      ];
}
