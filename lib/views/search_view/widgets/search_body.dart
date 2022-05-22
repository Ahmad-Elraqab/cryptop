import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/views/search_view/widgets/filter_buttons.dart';
import 'package:cryptop/views/search_view/widgets/search_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    Key? key,
    this.searchController,
    this.setSearch,
    this.onTap,
    this.tickers,
    this.type,
    this.setFilter,
    this.filter,
  }) : super(key: key);

  final TextEditingController? searchController;
  final Function? setSearch;
  final Function? onTap;
  final String? type;
  final Function? setFilter;
  final Map? filter;
  final List<Ticker>? tickers;

  List<Ticker>? _filter(List fav) {
    if (filter!['index'] == 1) {
      if (filter!['value'] == false) {
        tickers!.sort((a, b) => a.symbol!.compareTo(b.symbol!));
      } else {
        tickers!.sort((a, b) => b.symbol!.compareTo(a.symbol!));
      }
    } else if (filter!['index'] == 2) {
      if (filter!['value'] == false) {
        tickers!.sort((a, b) => a.volume!.compareTo(b.volume!));
      } else {
        tickers!.sort((a, b) => b.volume!.compareTo(a.volume!));
      }
    } else if (filter!['index'] == 3) {
      if (filter!['value'] == false) {
        tickers!.sort(
            (a, b) => a.priceChangePercent!.compareTo(b.priceChangePercent!));
      } else {
        tickers!.sort(
            (a, b) => b.priceChangePercent!.compareTo(a.priceChangePercent!));
      }
    }
    if (type == 'Spot' && tickers != null) {
      return tickers!
          .where(
              (e) => e.symbol!.toLowerCase().startsWith(searchController!.text))
          .toList();
    } else {
      return fav
          .map((e) => tickers!.where((v) => v.symbol == e).first)
          .toList()
          .where(
              (v) => v.symbol!.toLowerCase().startsWith(searchController!.text))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> headers = ['Spot', 'Favorite'];
    final favoriteList =
        context.read(chartViewmodel).list.map((e) => e['symbol']).toList();
    final list = _filter(favoriteList);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.reply,
              size: 30.0,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: CustomerTextField(
                borderColor: Colors.transparent,
                color: Colors.white,
                error: 'error',
                labelText: 'Search your service',
                lines: 1,
                onChanged: (value) => setSearch!(),
                readonly: false,
                secure: false,
                validate: false,
                controller: searchController!,
              ),
            ),
          ],
        ),
        const Divider(
          height: 1,
          thickness: 2,
          color: Colors.amber,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            for (String i in headers)
              InkWell(
                onTap: () => null,
                child: Container(
                  margin: EdgeInsets.only(right: 10.0, top: 10.0),
                  width: 80.0,
                  child: CustomButtom(
                    fontSize: 14,
                    borderColor: Colors.transparent,
                    borderRadius: 5.0,
                    height: null,
                    horizontal: 8,
                    width: 100.0,
                    vertical: 5,
                    buttonTextColor: i == type ? Colors.black54 : Colors.white,
                    hasImage: false,
                    buttonColor:
                        i == type ? Colors.amberAccent : Colors.transparent,
                    buttonText: i.toString(),
                    imageUrl: '',
                    onTap: () => onTap!(i),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        FilterButtons(filter: filter, setFilter: setFilter),
        Expanded(
          child: tickers == null
              ? LoadingAnimation()
              : ListView.builder(
                  itemCount: list!.length,
                  padding: const EdgeInsets.only(top: 10.0),
                  itemBuilder: (context, index) => SearchRow(
                    ticker: list[index],
                    favorite: favoriteList,
                  ),
                ),
        )
      ],
    );
  }
}
