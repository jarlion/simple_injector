import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:injector/injector.dart';

abstract class IA {
  bool ok;
}

class A implements IA {
  A();
  bool ok;
}

class B {
  B();
}

class C {
  final IA a;
  C(this.a);
}

class D {
  final IA a;
  final B b;
  D(this.a, this.b);
}

class Cf {}

void main() {
  // test("Define instances using Module", () {
  //   InjectorIO.start()
  //       .module( MyModule());
  // });

  // test("single Definition should return same instance", () {
  //   single<IA>(A());
  //   single(B());
  //   single(C(get()));
  //   single(D(get(), getInstance()));

  //   A a1 = get();
  //   A a2 = get();

  //   assert(a1 == a2);
  // });

  // test("single Definition should return same instance", () {
  //   single<IA>(A());
  //   single(B());
  //   single(C(get()));
  //   single(D(get(), getInstance()));

  //   A a1 = get();
  //   A a2 = get();

  //   assert(a1 == a2);
  // });

  // test("single Definition should return same instance", () {
  //   single(A());
  //   single(B(get()));

  //   A a1 = get();
  //   A a2 = get();

  //   assert(a1 == a2);
  // });

  // test('factory Definition should return diferent instances', () {
  //   InjectorIO.start().factory(() => A());

  //   A b1 = get();
  //   A b2 = get();
  //   A b3 = get();

  //   print("B1: ${b1.hashCode} B2: ${b2.hashCode} B3: ${b3.hashCode}");

  //   assert(b1.hashCode != b2.hashCode);
  // });

  // test('reuse class instace between Definitions', () {
  //   InjectorIO.start().single(A()).factory(() => B(get()));

  //   final A a = get();
  //   final B b = get();

  //   assert(a == b.a);
  // });

  // test('throw error if no instance found', () {
  //   InjectorIO.start().factory(() => B(get()));

  //   throwsA(() => get<A>());
  // });

  // test("throw if trying to register a Widget class", () {
  //   InjectorIO.start().single(MyWidget());
  // });
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
