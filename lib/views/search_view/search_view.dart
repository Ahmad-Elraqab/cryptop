import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/views/search_view/widgets/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/ticker_viewmodel/ticker_action.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  setSearch() => setState(() => {});

  // ignore: avoid_print
  onTap(index) => setState(() => print(index));
  List<Ticker>? ticker_24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer(builder: (context, watch, child) {
          ticker_24 = watch(get24Ticker).data?.value;
          watch(messageProvider).whenData(
              (value) => {watch(tickerViewmodel).updateTickers(value)});

          return Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(55, 61, 76, 1),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: SearchBody(
              tickers: ticker_24,
              searchController: searchController,
              setSearch: setSearch,
              onTap: onTap,
            ),
          );
        }),
      ),
    );
  }
}
