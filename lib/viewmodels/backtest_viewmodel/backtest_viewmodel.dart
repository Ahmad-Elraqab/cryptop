import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/models/backtest_models/rsi_backtest_model.dart';
import 'package:cryptop/services/backtest_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row, Border;
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

class BacktestViewmodel extends ChangeNotifier {
  bool? loading = false;
  List<BacktestModel>? smartTradeList;
  BacktestService get rest => dependency();
  List<BacktestModel>? _st;

  List excelRsi = [
    'id',
    'symbol',
    'startDate',
    'endDate',
    'amount',
    'isSell',
    'buyPrice',
    'sellPrice',
    'rate',
    'profitAfter'
  ];
  final char = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'Y',
    'Z'
  ];

  Future<BacktestModel?> createBacktest(Map<String, dynamic> object) async {
    final BacktestModel? _st = await rest.createBacktest(object);
    notifyListeners();
    return _st;
  }

  Future<List<BacktestModel>?> getBacktest() async {
    _st = await rest.getBacktest();
    return _st;
  }

  Future<void> createExcel(index) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    List<int> bytes = workbook.saveAsStream();
    if (_st![index] is RSIBacktestModel) {
      final obj = (_st![index] as RSIBacktestModel);

      for (var i = 0; i < obj.orderList!.length + 1; i++) {
        for (var j = 0; j < excelRsi.length; j++) {
          if (i == 0) {
            sheet
                .getRangeByName(char[j] + (i + 1).toString())
                .setText(excelRsi[j].toString());
          } else {
            if (excelRsi[j] == 'startDate' || excelRsi[j] == 'endDate') {
              sheet.getRangeByName(char[j] + (i + 1).toString()).setText(
                  DateTime.fromMillisecondsSinceEpoch(
                          obj.orderList![i - 1][excelRsi[j]])
                      .toString());
            } else {
              sheet
                  .getRangeByName(char[j] + (i + 1).toString())
                  .setText(obj.orderList![i - 1][excelRsi[j]].toString());
            }
          }
        }
      }
      bytes = workbook.saveAsStream();
      workbook.dispose();
    }
    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
          Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }
}
