import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
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

  String listType = 'Spot';
  onTap(type) => setState(() => listType = type);

  setSearch() => setState(() => {});

  String filter = 'C_UP';
  setFilter(value) => setState(() => {filter = value});

  List<Ticker>? getList(List<Ticker>? ticker_24, favorite) {
    if (listType == 'Favorite' && ticker_24 != null) {
      return ticker_24
          .where((e) =>
              favorite.contains(e.symbol) &&
              e.symbol!.toLowerCase().startsWith(searchController.text))
          .toList();
    } else if (listType == 'Spot' && ticker_24 != null) {
      return ticker_24
          .where(
              (e) => e.symbol!.toLowerCase().startsWith(searchController.text))
          .toList();
    }
    return ticker_24;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer(builder: (context, watch, child) {
          List<Ticker>? ticker_24 =
              watch(tickerViewmodel).getSortedTicker(filter);
          final favorite = context
              .read(chartViewmodel)
              .list
              .map((e) => e['symbol'])
              .toList();

          final data = getList(ticker_24, favorite);

          return Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(55, 61, 76, 1),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: SearchBody(
              searchController: searchController,
              tickers: data,
              favorite: favorite,
              type: listType,
              filter: filter,
              onTap: onTap,
              setFilter: setFilter,
              setSearch: setSearch,
            ),
          );
        }),
      ),
    );
  }
}
