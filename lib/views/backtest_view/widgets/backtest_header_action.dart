import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/models/backtest_model.dart';
import 'package:cryptop/views/backtest_view/widgets/backtest_header_form.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_buttom/custom_button.dart';

class BacktestHeaderAction extends StatelessWidget {
  const BacktestHeaderAction({
    Key? key,
    this.backtest,
    this.selected,
  }) : super(key: key);

  final List<int>? selected;
  final List<BacktestModel>? backtest;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButtom(
          borderColor: Colors.transparent,
          borderRadius: 5.0,
          buttonColor: Colors.amber,
          buttonText: 'Compare',
          buttonTextColor: Colors.white,
          fontSize: 12,
          hasImage: false,
          height: 30.0,
          horizontal: 10.0,
          vertical: 4.0,
          imageUrl: '',
          onTap: () {
            if (selected!.isEmpty || selected!.length < 2) {
              debugPrint('hihi');
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar('select at least 2 items'));
            } else {
              Navigator.pushNamed(
                context,
                rBacktestResults,
                arguments: {'backtest': backtest, 'selected': selected},
              );
            }
          },
        ),
        const SizedBox(width: 15.0),
        CustomButtom(
          borderColor: Colors.transparent,
          borderRadius: 5.0,
          buttonColor: Colors.grey,
          buttonText: 'Create',
          buttonTextColor: Colors.white,
          fontSize: 12,
          hasImage: false,
          height: 30.0,
          horizontal: 10.0,
          vertical: 4.0,
          imageUrl: '',
          onTap: () => showBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
                color: Color.fromARGB(255, 39, 44, 56),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BacktestHeaderForm(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
