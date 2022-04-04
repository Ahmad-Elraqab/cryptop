import 'package:cryptop/views/search_view/widgets/search_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  setSearch(value) => setState(() => {
        searchController.text = value,
        searchController.selection = TextSelection(
          baseOffset: value.length,
          extentOffset: value.length,
        )
      });
  onTap(index) => setState(() => print(index));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF24242B),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: SearchBody(
            searchController: searchController,
            setSearch: setSearch,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
