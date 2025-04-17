import 'dart:math';

int game_v = 1;

class do_4_gam_c {
  List e1 = [];
  List e2 = [];
  List e3 = [];
  List e4 = [];

  do_4_gam_cc(vv) {
    if (vv != 0) {
      while (e1.length < 6) {
        int r1 = new Random().nextInt(27) + 1;
        if (e1.any((element) => element == r1)) {
        } else {
          e1.add(r1);
        }
      }
      while (e2.length < 6) {
        int r2 = new Random().nextInt(6);
        if (e2.any((element) => element == e1[r2])) {
        } else {
          e2.add(e1[r2]);
        }
      }
      e1.addAll(e2);

      while (e3.length < 12) {
        int r3 = new Random().nextInt(12);
        if (e3.any((element) => element == r3)) {
        } else {
          e3.add(r3);
        }
      }
      e3.forEach((element) => e4.add(e1[element]));
    }

    return e4;
  }
}
