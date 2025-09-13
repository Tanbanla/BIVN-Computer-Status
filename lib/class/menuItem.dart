import 'package:flutter/material.dart';

class Menuitem{
  final IconData icon;
  final String title;
  final List<Item> submenus;
  Menuitem(this.icon, this.title, this.submenus);
}
class Item{
  final IconData icon;
  final String title;
  final Widget screen;
  Item(this.icon, this.title, this.screen);
}