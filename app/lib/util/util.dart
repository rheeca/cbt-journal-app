void updateOrAppend<T>(List<T> list, int index, T value) {
  if (index >= 0 && index < list.length) {
    list[index] = value;
  } else {
    list.add(value);
  }
}

T? getAtIndexOrNull<T>(List<T> list, int index) {
  return (index >= 0 && index < list.length) ? list[index] : null;
}
