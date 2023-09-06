## clean_provider

[![Github stars](https://img.shields.io/github/stars/elbeicktalat/clean_provider?logo=github)](https://github.com/elbeicktalat/clean_provider)
[![Pub Version](https://img.shields.io/pub/v/clean_provider?color=blue&logo=dart)](https://pub.dev/packages/clean_provider)

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

1) Add this to your packages pubspec.yaml file:

```yaml
dependencies:
  clean_provider: <^last>
```

2) Install it
   You can install it from the command line:

```bash
$ flutter pub get
```

3) Import it
   Now in Dart code, you can use:

```dart
import 'package:clean_provider/clean_provider.dart';
```

## Recommendation

We highly recommend you to use the clean architecture in order to achieve the power of this package.

Tip: Try to flow something similar to the provided examples under `/example` folder.

```
<future_name> --> The name of your (micro_service) examples: user, auth, home etc.
    |
    |_ data --> The data layer.
    |    |
    |    |_ data_sources --> Holds the data sources ether local or remote.
    |    |    |
    |    |    |_ remote --> Holds the contract and all implemntation of the remote data source kown as API calls.
    |    |    |    |
    |    |    |    |_ <future_name>_remote_data_source.dart --> The remote data source contarct.
    |    |    |    |_ <future_name>_remote_data_source_impl.dart --> One implementation of the remote data source contarct.
    |    |    |    |
    |    |    |_ local --> Holds the contract and all implemntation of the local data source such as data caching.
    |    |         |
    |    |         |_ <future_name>_local_data_source.dart --> The local data source contarct.
    |    |         |_ <future_name>_local_data_source_impl.dart --> One implementation of the local data source contarct.
    |    |
    |    |_ models --> Holds the conversation logic.
    |    |    |
    |    |    |_ <entity_name> --> Holds a spesific entity conversation logic.
    |    |           |_ <entity_name>_model.dart 
    |    |           |_ <entity_name>_model.g.dart
    |    | 
    |    |_ <future_name>_repository_impl.dart --> The implementation of <future_name>_repository.dart of domain layer.
    |
    |_ domain --> The independent layer, in this layer you sholde avoid any logic.
    |    |
    |    |_ <future_name>_data_source.dart --> The commen data source contarct for this future, this must be inhereted the remote & local contarcts.
    |    |_ <future_name>_entity.dart --> The entity, this is a blu print of what is your logic shold look like.
    |    |_ <future_name>_repository.dart --> The repositoty, the middle man between the view_model and the data_sources
    |
    |_ providers --> Holdes all providers related to this future.
    |    |_ <future_name>_providers.dart
    |
    |_ presentation --> The presentation layer.
         |
         |_ model --> Contains UI models.
         |
         |_ view
         |    |_ <future_name>_scene.dart --> The main future UI.
         |    |_ widgets --> Holds all utils widgets for this future.
         |
         |_ view_model --> holds all view_models related to this future. 
               |_ <future_name>_view_model.dart --> The main future view_model.
```

## Usage

This library comes with:

- `Scene` --> Extends the `StatelessWidget` to the next level, offering you a clean approach to
  build your UI.
- `ResponsiveScene` --> The responsive version of `Scene`
- `SceneConsumer` --> Receive providers list and consume them with a regular provider `Consumer`
- `ViewModel` --> The business logic or UI level state holder.

In order to work properly you have to follow an ordered steps as follow:

1) Create the `CounterViewModel`
2) Create the `CounterScnen`
3) Create the `CounterPage`

### ViewModel

1) Create the `CounterViewModel`
2) Define your `Listenable`s fields
3) Pass the `Listenable`s to the `notifiers` list in order to auto-update the UI
4) Define your custom logic.

```dart
class CounterViewModel extends ViewModel {
  int get counter => _counter.value;
  final ValueNotifier<int> _counter = 0.listen;

  void increment() => _counter.value++;

  void decrement() => _counter.value--;

  @override
  List<ChangeNotifier> get notifiers =>
      <ChangeNotifier>[
        _counter,
      ];
}
```

### Scene

A `StatelessWidget` extended to the next level.

1) Create the `CounterScnen` and pass the `CounterViewModel` to it as generic type
2) Build your UI using the `bulder` method
3) Use the `context` passed globally
4) Access your `CounterViewModel` members using `viewModel.<your_member>`

```dart
class CounterScene extends Scene<CounterViewModel> {
  const CounterScene(super.viewModel, {
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
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
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
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
```

### Page

or you can call it however you like, I recommend you to call it as `Page` since you'll need
it during navigation.

1) Create the `<your>Page` as regular `StatelessWidget`
2) Within the `build` method return the `SceneConsumer` widget and pass `<your>ViewModel` as the
   generic type to it
3) Pass your `<your>Scene` to the builder and pass the received `<your>ViewModel` to it
4) Pass your providers to the `SceneConsumer`

```dart
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SceneConsumer<CounterViewModel>(
      // use CounterView.new if no other params to receive.
          (CounterViewModel viewModel) =>
          CounterScene(
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
```