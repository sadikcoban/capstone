import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';

class DropdownString extends StatelessWidget {
  final String labelText;
  final List<String> liste;
  final String secilenItem;
  final Function(String?) onchanged;

  const DropdownString(
      {Key? key,
      required this.labelText,
      required this.liste,
      required this.secilenItem,
      required this.onchanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dropDownString(
        labelText: labelText,
        liste: liste,
        secilenItem: secilenItem,
        onchanged: onchanged);
  }

  static dropDownString(
      {required String labelText,
      required List<String> liste,
      required String secilenItem,
      required Function(String?) onchanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: DropdownSearch<String>(
        mode: Mode.DIALOG,
        dropdownSearchDecoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Renkler.ikonAktif,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          filled: true,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF01689A)),
          ),
        ),
        showAsSuffixIcons: true,
        clearButtonBuilder: (_) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.clear,
            size: 24,
            color: Colors.black,
          ),
        ),
        dropdownButtonBuilder: (_) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_drop_down,
            size: 24,
            color: Colors.black,
          ),
        ),
        showSelectedItems: true,
        items: liste,
        showClearButton: true,
        onChanged: onchanged,
        selectedItem: secilenItem,
      ),
    );
  }
}
