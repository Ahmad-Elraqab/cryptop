import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.searchController,
    required this.search,
  }) : super(key: key);

  final TextEditingController? searchController;
  final Function? search;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.search,
              color: Color.fromRGBO(36, 36, 43, 1),
            ),
          ),
          Expanded(
            flex: 9,
            child: CustomerTextField(
              borderColor: Colors.transparent,
              color: Colors.black,
              error: 'Invalid Input',
              labelText: 'Lookup your pair',
              lines: 1,
              readonly: false,
              secure: false,
              validate: false,
              controller: searchController,
              onChanged: search,
            ),
          ),
        ],
      ),
    );
  }
}
