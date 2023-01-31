import 'package:flutter/material.dart';

class GerenciamentoPagina {
  PageController _pageController;
  int pagina = 0;
  GerenciamentoPagina(this._pageController);

  void setPage(int value) {
    if (value == pagina) return;
    pagina = value;
    _pageController.jumpToPage(value);
  }
}
