import 'package:diary_report_sample/utils/zero_suppress.dart';

void main() {
  testZeroSuppress();
}

void testZeroSuppress() {
  assert(zeroSuppress("") == 0);

  assert(zeroSuppress("00.01") == 0.01);
  assert(zeroSuppress("010") == 10.0);
  assert(zeroSuppress("0.100") == 0.1);
  assert(zeroSuppress("00.00") == 0.0);
  assert(zeroSuppress("00.010") == 0.01);

  assert(zeroSuppress("01.120") == 1.12);

  assert(zeroSuppress("1") == 1.0);
  assert(zeroSuppress("0") == 0.0);
  assert(zeroSuppress("123.456") == 123.456);
  assert(zeroSuppress("123.400") == 123.4);
  assert(zeroSuppress("0.001") == 0.001);
  assert(zeroSuppress("0000.0001") == 0.0001);

  print("Success!");
}
