import 'package:flutter/material.dart';

class Inventory {
  final Stream id_inventory;
  final String name_inventory;
  final String type_inventory;
  final String total_quantiny_inventory;
  final String quantiny_stock_inventory;
  final String borrowed_quantiny_inventory;

  const Inventory(
      {required this.id_inventory,
      required this.name_inventory,
      required this.type_inventory,
      required this.total_quantiny_inventory,
      required this.quantiny_stock_inventory,
      required this.borrowed_quantiny_inventory});
}
