// library src.injector;
import 'dart:collection';

class Injector {
  final LinkedHashMap<Type, Single> _definitions = LinkedHashMap.identity();

  Injector _register(Definition def, String argName) {
    if (def == null) throw _argumentCouldNotBeNull(argName);
    _definitions[def.key] = def;
    return this;
  }

  T get<T>() {
    if (_definitions.containsKey(T)) {
      return _definitions[T].getInstance();
    }

    throw _instanceNotFound(T);
  }

  /// Register a singleton instance
  Injector single<T>(T def) => _register(Single(T, def), "def");

  /// Register a factory instance
  Injector factory<T>(Creator<T> creator) =>
      _register(Factory(T, creator), "creator");

  /// merge other injector
  Injector merge(Injector injector) {
    if (injector == null) throw _argumentCouldNotBeNull("injector");
    _definitions.addEntries(injector._definitions.entries);
    return this;
  }

  Exception _argumentCouldNotBeNull(String arg) =>
      Exception(""" The argument $arg could not bet null """);

  Exception _instanceNotFound(T) =>
      Exception("""Instance of $T not found. Make sure you added
        it by using add() or with [single()], [factory()] definition.""");
}

Injector _injector = Injector();

Injector merge(Injector other, {Injector injector}) =>
    (injector ?? _injector).merge(other);
Injector single<T>(T def, {Injector injector}) =>
    (injector ?? _injector).single<T>(def);
Injector factory<T>(Creator<T> creator, {Injector injector}) =>
    (injector ?? _injector).factory<T>(creator);
Injector factory<T>(Creator<T> creator, {Injector injector}) =>
    (injector ?? _injector).factory<T>(creator);
T get<T>({Injector injector}) => (injector ?? _injector).get<T>();
T getInstance<T>({Injector injector}) => get<T>(injector: injector);

abstract class Definition<T> {
  getInstance();
  Type key;
  Definition(this.key);
}

class Single<T> extends Definition<T> {
  T instance;
  Single(key, this.instance) : super(key);

  @override
  getInstance() => instance;
}

class Factory<T> extends Definition<T> {
  Creator<T> creator;
  Factory(key, this.creator) : super(key);

  @override
  getInstance() => creator();
}

typedef Creator<T> = T Function();
