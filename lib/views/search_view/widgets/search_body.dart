import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/ticker_model.dart';
import 'package:cryptop/views/search_view/widgets/search_row.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    Key? key,
    this.searchController,
    this.setSearch,
    this.onTap,
    this.tickers,
  }) : super(key: key);

  final TextEditingController? searchController;
  final Function? setSearch;
  final Function? onTap;
  final List<Ticker>? tickers;

  @override
  Widget build(BuildContext context) {
    final data = exchange_pairs.where(
        (element) => element.startsWith(searchController!.text.toUpperCase()));
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
        TextComponent(
          align: TextAlign.start,
          fontSize: 14.0,
          line: 1,
          textColor: Colors.white,
          title: data.length.toString() + ' Symbols',
          weight: FontWeight.bold,
        ),
        Expanded(
          child: tickers == null
              ? LoadingAnimation()
              : ListView.builder(
                  itemCount: data.length,
                  padding: const EdgeInsets.only(top: 20.0),
                  itemBuilder: (context, index) => SearchRow(
                    ticker: tickers!
                        .where((e) => e.symbol == exchange_pairs[index])
                        .first,
                    data: data.toList(),
                    index: index,
                    onTap: onTap,
                  ),
                ),
        )
      ],
    );
  }
}
