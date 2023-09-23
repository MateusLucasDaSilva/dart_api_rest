extension ListExtension<E> on List<E> {
  E? firstWhereOrNull(bool Function(E element) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  bool insertWhereEquals(E value) {
    final index = indexOf(value);
    if (index != -1) {
      this[index] = value;
      return true;
    }
    return false;
  }
}
