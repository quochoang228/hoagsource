import 'dart:async';
import 'dart:math';

/// Extension for T
extension GenericExtention<T> on T {
  /// Check Null
  bool get isNull => this == null;

  T safe(T Function() supplier) => this ?? supplier();
}

/// Extension for Object
extension Lambdas<T> on T {
  T also(void Function(T it) fun) {
    fun(this);
    return this;
  }

  R let<R>(R Function(T it) fun) => fun(this);
}

/// Extension for Comparable on Iterable
extension ComparableIterableExtensions<E extends Comparable<E>> on Iterable<E> {
  List<E> sorted() => toList()..sort();

  E? min() {
    final Iterator<E> iterator = this.iterator;
    if (!iterator.moveNext()) {
      return null;
    }
    E min = iterator.current;
    while (iterator.moveNext()) {
      final E e = iterator.current;
      if (min > e) {
        min = e;
      }
    }
    return min;
  }

  E? max() {
    final Iterator<E> iterator = this.iterator;
    if (!iterator.moveNext()) {
      return null;
    }
    E max = iterator.current;
    while (iterator.moveNext()) {
      final E e = iterator.current;
      if (max < e) {
        max = e;
      }
    }
    return max;
  }
}

/// Extension for Set
extension SetExtensions<E> on Set<E> {
  Set<E> filterNotNull() => where((E it) => it != null).toSet();
}

/// Extension for Map
extension MapExtensions<K, V> on Map<K, V> {
  V? get(K key) => this[key];

  V? getOrDefault(K key, V value) => containsKey(key) ? this[key] : value;
}

/// Extension for Iterable of Iterable
extension IterableIterableExtensions<E> on Iterable<Iterable<E>> {
  List<E> flatten() => expand((Iterable<E> it) => it).toList(growable: false);
}

/// Extension for Comparable
extension ComparableExtensions<T> on Comparable<T> {
  bool operator >(T value) => compareTo(value) == 1;

  bool operator >=(T value) =>
      compareTo(value).let((int it) => it == 1 || it == 0);

  bool operator <(T value) => compareTo(value) == -1;

  bool operator <=(T value) =>
      compareTo(value).let((int it) => it == -1 || it == 0);
}

extension IterableExtensions<E> on Iterable<E> {
  /// Returns the first element.
  ///
  /// Returns `null` if `this` is empty.
  /// Otherwise returns the first element in the iteration order
  E? get firstOrNull =>
      iterator.let((Iterator<E> it) => !it.moveNext() ? null : it.current);

  E? get lastOrNull {
    final Iterator<E> it = iterator;
    if (!it.moveNext()) {
      return null;
    }
    E result;
    do {
      result = it.current;
    } while (it.moveNext());
    return result;
  }

  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// If no element satisfies [test], the result returns `null`
  E? find(bool Function(E element) test) {
    for (final E element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  List<E> filter(bool Function(E element) test) =>
      where(test).toList(growable: false);

  List<E> filterNotNull() =>
      where((E it) => it != null).toList(growable: false);

  E? minBy<R extends Comparable<R>>(R Function(E element) selector) {
    final Iterator<E> iterator = this.iterator;
    if (!iterator.moveNext()) {
      return null;
    }
    E minElem = iterator.current;
    if (!iterator.moveNext()) {
      return minElem;
    }
    R minValue = selector(minElem);
    do {
      final E e = iterator.current;
      final R v = selector(e);
      if (minValue > v) {
        minElem = e;
        minValue = v;
      }
    } while (iterator.moveNext());
    return minElem;
  }

  E? minWith(int Function(E a, E b) compare) {
    final Iterator<E> iterator = this.iterator;
    if (!iterator.moveNext()) {
      return null;
    }
    E min = iterator.current;
    while (iterator.moveNext()) {
      final E e = iterator.current;
      if (compare(min, e) > 0) {
        min = e;
      }
    }
    return min;
  }

  /// Returns the first element yielding the largest value of the given function or `null` if there are no elements.
  ///
  /// @sample samples.collections.Collections.Aggregates.maxBy
  E? maxBy<R extends Comparable<R>>(R Function(E element) selector) {
    final Iterator<E> iterator = this.iterator;
    if (!iterator.moveNext()) {
      return null;
    }
    E maxElem = iterator.current;
    if (!iterator.moveNext()) {
      return maxElem;
    }
    R maxValue = selector(maxElem);
    do {
      final E e = iterator.current;
      final R v = selector(e);
      if (maxValue < v) {
        maxElem = e;
        maxValue = v;
      }
    } while (iterator.moveNext());
    return maxElem;
  }

  /// Returns the first element having the largest value according to the provided [comparator] or `null` if there are no elements.
  E? maxWith(int Function(E a, E b) compare) {
    final Iterator<E> iterator = this.iterator;
    if (!iterator.moveNext()) {
      return null;
    }
    E max = iterator.current;
    while (iterator.moveNext()) {
      final E e = iterator.current;
      if (compare(max, e) < 0) {
        max = e;
      }
    }
    return max;
  }

  int sumBy(int Function(E element) fun) {
    int sum = 0;
    forEach((E it) => sum += fun(it));
    return sum;
  }

  String joinToString(
      {String separator = '',
      String prefix = '',
      String postfix = '',
      String Function(E element)? transform}) {
    String result = prefix;

    bool first = true;
    forEach((E it) {
      if (!first) {
        result += separator;
      } else {
        first = false;
      }
      result += transform == null ? '$it' : transform(it);
    });

    result += postfix;
    return result;
  }

  Future<List<R>> asyncMap<R>(FutureOr<R> Function(E element) fun) async {
    final List<R> items = <R>[];
    for (final E it in this) {
      items.add(await fun(it));
    }
    return items;
  }
}

/// Extension for List
extension ListExtensions<E> on List<E> {
  E get(int index) => this[index];

  void set(int index, E element) => this[index] = element;

  E? getOrNull(int index) => index < 0 || index >= length ? null : this[index];

  void forEachIndexed(void Function(int index, E element) f) {
    for (int i = 0; i < length; i++) {
      f(i, this[i]);
    }
  }

  List<R> mapIndexed<R>(R Function(int index, E value) transform) =>
      mapIndexedTo<R, List<R>>(<R>[], transform);

  C mapIndexedTo<R, C extends List<R>>(
      C destination, R Function(int index, E value) transform) {
    forEachIndexed(
        (int index, E element) => destination.add(transform(index, element)));
    return destination;
  }

  int get lastIndex => length - 1;

  List<E> reversedList() => reversed.toList(growable: false);

  List<E> shuffled([Random? random]) =>
      toList(growable: false)..shuffle(random);

  List<E> sorted(int Function(E a, E b) compare) =>
      toList(growable: false)..sort(compare);

  List<E> sortedBy<T extends Comparable<T>>(T Function(E value) selector) =>
      toList(growable: false)
        ..sort((E a, E b) => selector(a).compareTo(selector(b)));

  void moveAt(int oldIndex, int index) {
    final E item = this[oldIndex];
    removeAt(oldIndex);
    insert(index, item);
  }

  void move(int index, E item) {
    remove(item);
    insert(index, item);
  }

  int indexOfItem(E element, Iterable<int> exclude) {
    for (int i = 0; i < length; i++) {
      if (!exclude.contains(i) && this[i] == element) {
        return i;
      }
    }
    return -1;
  }

  int indexOfWhere(bool Function(int index, E element) test) {
    for (int i = 0; i < length; i++) {
      if (test(i, this[i])) {
        return i;
      }
    }
    return -1;
  }

  static List<E> insertBetween<E>(E delimiter, List<E> tokens) {
    final List<E> sb = <E>[];
    bool firstTime = true;
    for (final E token in tokens) {
      if (firstTime) {
        firstTime = false;
      } else {
        sb.add(delimiter);
      }
      sb.add(token);
    }
    return sb;
  }
}
