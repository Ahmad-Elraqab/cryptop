import 'package:flutter/material.dart';
import '../../../components/custom_buttom/custom_button.dart';
import '../../../components/text_component/text_component.dart';

class SubscriptionPackageBack extends StatelessWidget {
  const SubscriptionPackageBack({
    Key? key,
    this.package,
  }) : super(key: key);
  final Map? package;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextComponent(
                    align: TextAlign.start,
                    fontSize: 14.0,
                    line: 1,
                    textColor: Colors.white,
                    title: 'Access To:',
                    weight: FontWeight.bold,
                  ),
                  for (var item in package!['access'])
                    TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.amber,
                      title: item,
                      weight: FontWeight.bold,
                    ),
                ],
              ),
              package!['isSub'] == true
                  ? Column(
                      children: [
                        CustomButtom(
                          borderColor: Colors.transparent,
                          borderRadius: 10.0,
                          height: 40.0,
                          buttonColor: const Color(0xFFF1C40F),
                          buttonText: 'Upgrade',
                          buttonTextColor: Colors.white,
                          fontSize: 14.0,
                          hasImage: false,
                          onTap: () => {},
                          imageUrl: '',
                          width: 100.0,
                          horizontal: 0,
                          vertical: 0.0,
                        ),
                        const SizedBox(height: 10.0),
                        CustomButtom(
                          borderColor: Colors.transparent,
                          borderRadius: 10.0,
                          height: 40.0,
                          width: 100.0,
                          buttonColor: Colors.grey,
                          buttonText: 'Cancel',
                          buttonTextColor: Colors.white,
                          fontSize: 14.0,
                          hasImage: false,
                          onTap: () => {},
                          imageUrl: '',
                          horizontal: 0,
                          vertical: 0.0,
                        )
                      ],
                    )
                  : const SizedBox()
            ],
          ),
          package!['isSub'] == true
              ? const TextComponent(
                  align: TextAlign.center,
                  fontSize: 14.0,
                  line: 1,
                  textColor: Colors.white,
                  title: 'Ends on 10-5-2022',
                  weight: FontWeight.bold,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
