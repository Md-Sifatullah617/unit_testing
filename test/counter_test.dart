import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/counter.dart';

void main() {
  late Counter counter;
  //setup=> test=> setup=> test=> setup=> test
  setUp(() {
    counter = Counter();
  });

  //setupAll=> test=> test=> test
  setUpAll(() {});

  group("Testing Counter class - ", () {
    test(
        "when the counter class instantiate the counter value will always be 0",
        () {
      //Arrange
      //Act
      int value = counter.count;
      //Assert
      expect(value, 0);
    });

    test("increment by 1 while checking increment function", () {
      //arrange
      //act
      counter.incrementCounter();
      int value = counter.count;
      //assert
      expect(value, 1);
    });

    test("decrement by 1 while checking decrement function", () {
      //arrange

      //act
      counter.decrementCounter();
      int value = counter.count;
      //assert
      expect(value, -1);
    });

    test("when the counter class will be reseted then the value will be 0", () {
      //arrange
      //act
      counter.resetCounter();
      int value = counter.count;
      //assert
      expect(value, 0);
    });
  });

  //concept same as setup and setupAll
  tearDownAll(() {
    expect(counter.count, 0);
  });
}
