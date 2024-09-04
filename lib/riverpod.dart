import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_testing/counter_model.dart';

final riverpodEasyLevel = StateProvider<int>((ref) {
  return 0;
});

final riverpodHardLevel = ChangeNotifierProvider<CounterModel>((ref) {
  return CounterModel(counter: 0);
});
