import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Cat {
  String sound() => 'meow!';
}

class MockCat extends Mock implements Cat {}

void main() {
  group('', () {
    late final Cat cat;

    setUpAll(() {
      cat = MockCat();
    });

    tearDownAll(() {});

    test('cat sound', () {
      when(() => cat.sound()).thenReturn('woff');
      verifyNever(() => cat.sound());
      cat.sound();
      cat.sound();
      verify(() => cat.sound()).called(1);
    });
  });
}
