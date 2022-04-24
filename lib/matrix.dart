import 'package:flutter/material.dart';

class Matrix {
  Matrix({required this.position});

  int position;

  List<List<int>> totalfield =
      new List.generate(10, (i) => List<int>.generate(10, (j) => 0));

  void initField() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        totalfield[i][j] = 0;
      }
    }
    totalfield[4][4] = 1;
  }

  void moveRight() {
    int aux = -1;
    int aux2 = -1;

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (totalfield[i][j] == 1) {
          aux = i;
          aux2 = j;
        }
      }
    }
    if (aux != -1 && aux2 != -1 && aux2 != 9) {
      totalfield[aux][aux2] = 0;
      totalfield[aux][aux2 + 1] = 1;
    }
  }

  void moveLeft() {
    int aux = -1;
    int aux2 = -1;

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (totalfield[i][j] == 1) {
          aux = i;
          aux2 = j;
        }
      }
    }
    if (aux != -1 && aux2 != -1 && aux2 != 0) {
      totalfield[aux][aux2] = 0;
      totalfield[aux][aux2 - 1] = 1;
    }
  }

  void moveUp() {
    int aux = -1;
    int aux2 = -1;

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (totalfield[i][j] == 1) {
          aux = i;
          aux2 = j;
        }
      }
    }
    if (aux != -1 && aux2 != -1 && aux != 0) {
      totalfield[aux][aux2] = 0;
      totalfield[aux - 1][aux2] = 1;
    }
  }

  void moveDown() {
    int aux = -1;
    int aux2 = -1;

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (totalfield[i][j] == 1) {
          aux = i;
          aux2 = j;
        }
      }
    }
    if (aux != -1 && aux2 != -1 && aux != 9) {
      totalfield[aux][aux2] = 0;
      totalfield[aux + 1][aux2] = 1;
    }
  }
}
