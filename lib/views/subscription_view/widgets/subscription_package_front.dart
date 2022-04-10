import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../components/text_component/text_component.dart';

class SubscriptionPackageFront extends StatelessWidget {
  const SubscriptionPackageFront({
    Key? key,
    this.package,
  }) : super(key: key);
  final Map? package;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: package!['color'],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextComponent(
            align: TextAlign.start,
            fontSize: 20.0,
            line: 1,
            textColor: Colors.white,
            title: package!['name'],
            weight: FontWeight.bold,
          ),
          TextComponent(
            align: TextAlign.center,
            fontSize: 20.0,
            line: 1,
            textColor: Colors.white,
            title: package!['price'],
            weight: FontWeight.bold,
          ),
          CustomButtom(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            height: 40.0,
            buttonColor: Colors.amber,
            buttonText: 'Choose plan',
            buttonTextColor: Colors.white,
            fontSize: 14.0,
            hasImage: false,
            horizontal: 0,
            onTap: () => {},
            imageUrl: '',
            vertical: 4.0,
          )
        ],
      ),
    );
  }
}
