import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/search_view/widgets/search_row.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody(
      {Key? key, this.searchController, this.setSearch, this.onTap})
      : super(key: key);

  final TextEditingController? searchController;
  final Function? setSearch;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
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
                onChanged: setSearch!,
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
        const TextComponent(
          align: TextAlign.start,
          fontSize: 14.0,
          line: 1,
          textColor: Colors.white,
          title: '315 Symbols',
          weight: FontWeight.bold,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            padding: const EdgeInsets.only(top: 20.0),
            itemBuilder: (context, index) => SearchRow(
              index: index,
              onTap: onTap,
            ),
          ),
        )
      ],
    );
  }
}
