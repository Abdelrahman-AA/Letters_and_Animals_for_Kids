import 'dart:math';

List n1 = [1, 2, 5, 6, 7, 9, 14, 20, 21, 22, 24, 25, 26, 28];
int game_v2 = 1;

class do_4_gam_c2 {
  int r = 0;
  int r2 = 0;
  int r3 = 0;
  int r4 = 0;
  int f9 = 0;
  List n2 = [];
  List n3 = [];

  do_4_gam_b1(vv2) {
    if (vv2 != 0) {
      r = Random().nextInt(14);

      n2.add(n1[r]);
      f9 = n1[r];
      while (n2.length < 3) {
        r2 = Random().nextInt(14);
        if (n2.any((element) => element == n1[r2])) {
        } else {
          n2.add(n1[r2]);
        }
      }
      while (n3.length < 3) {
        r4 = Random().nextInt(3);

        if (n3.any((element) => element == n2[r4])) {
        } else {
          n3.add(n2[r4]);
        }
      }
    }
    n3.add(f9);
    // n3.last();
    // print("${n3[0]}+++++++++++++++++n2++++++++++++++++++++++++++++");

    return n3;
  }
}
