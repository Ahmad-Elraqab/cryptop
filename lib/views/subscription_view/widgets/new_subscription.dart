import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class NewSubscription extends StatelessWidget {
  const NewSubscription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextComponent(
            align: TextAlign.start,
            fontSize: 14.0,
            line: 1,
            textColor: Colors.white,
            title: 'Choose your plan',
            weight: FontWeight.bold,
          ),
          const TextComponent(
            align: TextAlign.center,
            fontSize: 9.0,
            line: 4,
            textColor: Colors.white,
            title:
                'lorem text dum plane thing lorem text dum plane thing lorem text dum plane thing lorem text dum plane thing lorem text dum plane thing lorem text dum plane thinglorem text dum plane thing lorem text dum plane thing lorem text dum plane thing',
            weight: FontWeight.w400,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: CustomButtom(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              height: 50.0,
              buttonColor: Colors.amber,
              buttonText: '1 Month Free',
              buttonTextColor: Colors.white,
              fontSize: 14.0,
              hasImage: false,
              horizontal: 0,
              onTap: () => {},
              imageUrl: '',
              vertical: 8.0,
            ),
          )
        ],
      ),
    );
  }
}
