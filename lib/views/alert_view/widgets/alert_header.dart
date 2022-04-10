import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_detail.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_buttom/custom_button.dart';

class AlertHeader extends StatelessWidget {
  const AlertHeader({
    Key? key,
    this.filter,
  }) : super(key: key);

  final Function? filter;
  @override
  Widget build(BuildContext context) {
    final textField = [
      'alert type',
      'alert value',
      'frequency',
    ];

    final List<TextEditingController> _controller =
        List.generate(3, (i) => TextEditingController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              height: 10.0,
              width: 10.0,
            ),
            const SizedBox(width: 10.0),
            const TextComponent(
              align: TextAlign.start,
              fontSize: 14.0,
              line: 1,
              textColor: Colors.white,
              title: 'Alerts List',
              weight: FontWeight.bold,
            ),
          ],
        ),
        CustomButtom(
          borderColor: Colors.transparent,
          borderRadius: 5.0,
          buttonText: 'Create',
          buttonColor: Colors.grey,
          buttonTextColor: Colors.white,
          fontSize: 12,
          hasImage: false,
          height: 30.0,
          horizontal: 10.0,
          vertical: 4.0,
          imageUrl: '',
          onTap: () => {
            showBottomSheet(
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
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GridView.count(
                      crossAxisCount: 1,
                      shrinkWrap: true,
                      childAspectRatio: 10,
                      mainAxisSpacing: 20.0,
                      children: [
                        for (int i = 0; i < textField.length; i++)
                          CustomerTextField(
                            borderColor: Colors.white,
                            color: Colors.white,
                            controller: _controller[i],
                            error: '',
                            labelText: textField[i],
                            lines: 1,
                            onChanged: () => {},
                            readonly: false,
                            secure: false,
                            validate: false,
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButtom(
                          borderColor: Colors.transparent,
                          borderRadius: 5.0,
                          buttonColor: Colors.amber,
                          buttonText: 'Create',
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
                          buttonText: 'Discard',
                          buttonTextColor: Colors.white,
                          fontSize: 12,
                          hasImage: false,
                          height: 30.0,
                          horizontal: 10.0,
                          vertical: 4.0,
                          imageUrl: '',
                          onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const SmartTradeDetail(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          },
        ),
      ],
    );
  }
}
