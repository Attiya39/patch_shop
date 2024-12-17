import 'dart:math';

extension NumLogBase on num {
  double logBase(num base) => log(this) / log(base);
}