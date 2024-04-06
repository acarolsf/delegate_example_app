import 'package:delegate_example_app/home/home_presenter.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements HomeViewDelegate {

  // The presenter has to be `late` to get the implementation
  late final HomePresenter _presenter = HomePresenter(this);

  int _counter = 0;

  // Once you add `implements xx` on the class, you must say
  // what the function will do.
  @override
  void counter(int value) {
    setState(() {
      _counter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Value Counter:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () => _presenter.increment(_counter),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: FloatingActionButton(
            backgroundColor: _counter <= 0 ? Colors.grey : null,
            onPressed: () => _counter <= 0 ? null : _presenter.decrement(_counter),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        )
      ]),
    );
  }
}
