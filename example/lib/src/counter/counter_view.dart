import 'package:clean_provider/clean_provider.dart';
import 'package:example/src/counter/counter_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide View;

class CounterView extends Scene<CounterViewModel> {
  const CounterView(
    super.viewModel, {
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
