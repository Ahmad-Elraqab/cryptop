import 'package:flutter/material.dart';
import '../text_component/text_component.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 50,
      border: const TableBorder(
        horizontalInside: BorderSide(color: Colors.white, width: 2),
      ),
      columns: const [
        DataColumn(label: Text('')),
        DataColumn(
          label: Center(
            child: TextComponent(
              align: TextAlign.center,
              fontSize: 14.0,
              line: 1,
              textColor: Colors.white,
              title: 'RSI-1',
              weight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Center(
            child: TextComponent(
              align: TextAlign.center,
              fontSize: 14.0,
              line: 1,
              textColor: Colors.white,
              title: 'RSI-2',
              weight: FontWeight.bold,
            ),
          ),
        ),
      ],
      rows: [
        for (int i = 0; i < 8; i++)
          const DataRow(
            cells: [
              DataCell(
                TextComponent(
                  align: TextAlign.center,
                  fontSize: 14.0,
                  line: 1,
                  textColor: Colors.white,
                  title: 'trade count',
                  weight: FontWeight.bold,
                ),
              ),
              DataCell(
                Center(
                  child: TextComponent(
                    align: TextAlign.center,
                    fontSize: 14.0,
                    line: 1,
                    textColor: Colors.white,
                    title: '20',
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              DataCell(
                Center(
                  child: TextComponent(
                    align: TextAlign.center,
                    fontSize: 14.0,
                    line: 1,
                    textColor: Colors.white,
                    title: '30',
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
