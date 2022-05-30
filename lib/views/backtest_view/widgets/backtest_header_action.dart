import 'package:cryptop/views/backtest_view/widgets/backtest_header_form.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_buttom/custom_button.dart';

class BacktestHeaderAction extends StatefulWidget {
  const BacktestHeaderAction({
    Key? key,
    this.filter,
  }) : super(key: key);

  final Function? filter;

  @override
  State<BacktestHeaderAction> createState() => _BacktestHeaderActionState();
}

class _BacktestHeaderActionState extends State<BacktestHeaderAction> {
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
          onTap: () => {},
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
              height: MediaQuery.of(context).size.height * 0.7,
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
