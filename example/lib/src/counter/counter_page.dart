import 'package:clean_provider/clean_provider.dart';
import 'package:example/src/counter/counter_scene.dart';
import 'package:example/src/counter/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SceneConsumer<CounterViewModel>(
      // use CounterView.new if no other params to receive.
      (CounterViewModel viewModel) => CounterScene(
        viewModel,
        title: 'Clean Provider Counter',
      ),
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<CounterViewModel>(
          create: (_) => CounterViewModel(),
        ),
      ],
    );
  }
}
