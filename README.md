# unit_testing

A new Flutter project.

## Getting Started

## Cheatsheet for riverpod
📖 CHEATSHEET 📖
** Riverpod set up **
ProviderScope
-----
** Easy level **
StateProvider
ConsumerWidget
ref.watch(riverpod)
ref.read(riverpod.notifier).state
-----
** Hard level (With a model) **
ChangeNotifierProvider
ChangeNotifier
notifyListeners
ConsumerWidget
ref.watch(riverpod).name
ref.read(riverpod).changeName(newName: newValue)
-----
** PS **
Watch = Listen to changes
Read = Don't listen to changes (Edit the value)