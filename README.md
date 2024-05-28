# Clean Provider 💎

A simple way to apply best practices such as (separation of concerns) with flutter and provider.

[![Github stars](https://img.shields.io/github/stars/elbeicktalat/clean_provider?logo=github)](https://github.com/elbeicktalat/clean_provider)
[![Pub Version](https://img.shields.io/pub/v/clean_provider?color=blue&logo=dart)](https://pub.dev/packages/clean_provider)

## Why This Package? 🤔

Talat's created this package for many reasons following some:
1) Community likes provider 👨‍💻
2) Provider doesn't try to do everything (forcing your hand and preventing you from using cool packages) 👌
3) For `Separation Of Concerns` side better, decoupling logic from the UI. 💪

`Provider` with the help of `ChangeNotifier` can do this, but it's not clear and not straightforward since there is no
prefixed pattern, they keep your free, but this can turn into cause.

This package takes the best features from `Provider`, and adds its own touch.

## Index 📑

- [Installation](#installation-)
- [Exciting](#exciting-)
- [Getting Started](#getting-started-)
- [ViewModel](#viewmodel-)
    - [Life Cycle](#life-cycle-)
        - [onInit](#oninit-)
        - [onDispose](#ondispose-)
- [View](#view-)
    - [Builder Method]()
    - [Global BuildContext]()
- [Page](#page-)
- [Recommended Folders Structure](#recommended-folders-structure-)

## Installation ⬇️

Add this to your pubspec.yaml file:

```yaml
dependencies:
  clean_provider: <^last>
```

## Exciting 🔥

The code below shows min part of the potential of this package.

This library comes with:

- `View` --> Extends the `StatelessWidget` to the next level, offering you a clean approach to build your UI.
- `Screen` --> The responsive version of `View`.
- `ViewModel` --> The business logic or UI level state holder.
- `Page` --> A normal `StatelessWidget` returning your `View` or `Screen` wrapped with `MultiProvider`.

```dart
// Remember to set the View generic `Type` in order to accesses your custom properties,
// getters, setters, methods in your Widget. As below HomeViewModel is subclass of ViewModel.
// If you don't specify the View generic `Type` then you'll be able to accesses only predefined stuff. e.g a context getter. 
class HomeView extends View<HomeViewModel> {
  HomeView({super.key});

  // Note: that you can assess the BuildContext globally in your widget.
  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: viewModel.navToNext, // Your custom method.
          child: const Text('Go Next'),
        ),
      ),
    );
  }
}

class HomeViewModel extends ViewModel {
  final String title = 'Clean Provider Example'; // can be fetched from an api, no matters you can send any thing to UI from here.

  void navToNext() {
    Navigator.push(
      context, // You can accesses the BuildContext globally in your ViewModel.
      MaterialPageRoute(
        builder: (context) {
          return const SecondPage();
        },
      ),
    );
  }
}

// Remember what we have side?
// The type parameter on View is optional, so in this case you cannot access custom invocation,
// but still able to get the predefined ones like the global context.
class SecondPage extends View {
  SecondPage({super.key});

  @override
  Widget builder() {
    return const Scaffold(
      body: Center(
        child: Text('Go back'),
      ),
    );
  }
}
```

## Getting Started 🚀

To work properly, you have to follow the ordered steps as follows:

1) Create your `ViewModel`
2) Create your `View`
3) Create your `Page`

## ViewModel 🧠

1) Create `<your>ViewModel`
2) Define your `Listenable`s fields
3) Pass the `Listenable`s to the `notifiers` list to auto-update the UI
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

### Life Cycle 🪴

The ViewModel comes with life cycle methods such as `onInit` which runs after the `ViewModel` injection. There is also
the Famous `onDispose` method which is needed to kill processes after `ViewModel` disposed.

#### onInit 🌱

```dart
class MyViewModel extends ViewModel {
  @override
  void onInit() {
    super.onInit();
    // TODO: add your implementation.
    // initialize variables etc.
  }
}
```

#### onDispose 🥀

```dart
class MyViewModel extends ViewModel {
  int get counter => _counter.value;
  final ValueNotifier<int> _counter = 0.listen;

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}
```

## View 📱

A `StatelessWidget` extended to the next level.

1) Create the `<your>View` and pass the `<your>ViewModel` to it as a generic type
2) Build your UI using the `bulder` method
3) Use the `context` passed globally
4) Access your `<your>ViewModel` members using `viewModel.<your_member>`

```dart
class CounterView extends View<CounterViewModel> {
  const CounterView({
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

### Screen Info ℹ️

Holds Screen util information such as the `width` or `height` received from `MediaQuery`.

```dart
class ExampleView extends View {
  ExampleView({super.key});

  @override
  Widget builder() {
    return Container(
      width: info.width * .5, // same as MediaQuery.of(context).size.width * .5
      height: info.height * .3, // MediaQuery.of(context).size.height * .3
    );
  }
}

```

### Global BuildContext 🌐

Thanks to the `ScreenInfo` we're able to access the `BuildContext` globally (no need to pass context from method to
other like in case of `StatelessWidget`).

```dart
class HomeView extends View {
  // Note: that you can assess the BuildContext globally in your widget.
  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context, // Accessing the BuildContext.
              MaterialPageRoute(
                builder: (context) {
                  return const SecondPage();
                },
              ),
            );
          },
          child: const Text('Go Next'),
        ),
      ),
    );
  }
}
```

## Page ⚙️

You can call it whatever you like, I recommend you to call it as `Page` since you'll need it during navigation.

1) Create the `<your>Page` as regular `StatelessWidget`
2) Within the `build` method return the `MultiProvider`
3) Pass your `<your>View` as child
4) Pass your providers to the `MultiProvider`

```dart
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterViewModel>(
          create: (_) => CounterViewModel(),
        )
      ],
      child: CounterView(
        title: 'Clean Provider Counter',
      ),
    );
  }
}
```

## Recommended Folders Structure 💯

We highly recommend you to use the clean architecture to achieve the power of this package.

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
    |
    |_ domain --> The independent layer, in this layer you sholde avoid any logic.
    |    |
    |    |_ <future_name>_entity.dart --> The entity, this is the blu print of what your logic shold look like.
    |    |_ <future_name>_repository.dart --> The repository contract, the middle man between the view_model and the data_sources.
    |
    |
    |_ providers --> Holdes all providers related to this future.
    |    |_ <future_name>_providers.dart
    |
    |
    |_ presentation --> The presentation layer.
         |
         |_ models --> Contains UI models.
         |
         |_ view
         |    |_ <future_name>_scene.dart --> The main future UI.
         |    |_ widgets --> Holds all utils widgets for this future.
         |
         |_ view_model --> holds all view_models related to this future. 
         |     |_ <future_name>_view_model.dart --> The main future view_model.
         |
         |_ utils --> Contains utils reiusable code over this future.
```