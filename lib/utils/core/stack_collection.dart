class StackCollection<T> {
  final List<T> _list;
  StackCollection() : _list = [];

  void push(T value) => _list.add(value);

  T? pop() => isNotEmpty ? _list.removeLast() : null;

  T? top() => isNotEmpty ? _list.last : null;

  void clear() => _list.clear();

  int get length => _list.length;
  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}
