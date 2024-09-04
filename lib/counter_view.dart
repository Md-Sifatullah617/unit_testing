import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_testing/riverpod.dart';

import 'userdatalist.dart';

class MyHomePage extends ConsumerWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  // final Counter counter = Counter();
  // void _incrementCounter() {
  //   setState(() {
  //     counter.incrementCounter();
  //   });
  // }
  //
  // void _decrementCounter() {
  //   setState(() {
  //     counter.decrementCounter();
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserDataListScreen()));
              },
              child: const Text(
                "Go for api function Unit test",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            //! Easy Level
            // Text(
            //   ref.watch(riverpodEasyLevel).toString(),
            //   style: Theme.of(context).textTheme.headlineLarge,
            // ),

            //! Hard Level
            Text(
              ref.watch(riverpodHardLevel).counter.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              //! Easy Level
              // ref.read(riverpodEasyLevel.notifier).state++;

              //! Hard Level
              ref.read(riverpodHardLevel.notifier).incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              //! Easy Level
              // ref.read(riverpodEasyLevel.notifier).state--;

              //! Hard Level
              ref.read(riverpodHardLevel.notifier).decrementCounter();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
