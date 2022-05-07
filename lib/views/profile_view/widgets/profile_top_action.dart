import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class ProfileTopAction extends StatelessWidget {
  const ProfileTopAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.amberAccent,
                ),
              ),
              CustomButtom(
                borderColor: Colors.transparent,
                borderRadius: 5.0,
                buttonColor: Colors.amberAccent,
                buttonText: 'Generate Key',
                buttonTextColor: Colors.black,
                fontSize: 12,
                hasImage: false,
                vertical: 0,
                height: 40.0,
                horizontal: 8.0,
                imageUrl: '',
                onTap: () => {},
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          // const TextComponent(
          //   align: TextAlign.center,
          //   fontSize: 12,
          //   line: 3,
          //   textColor: Colors.black,
          //   title:
          //       'xXsjdndfmxzxXsjdndfmxzxXsjdndfmxzxXsjdndfmxzxXsjdndfmxzxXsjdndfmxzxXsjdndfmxzxXsjdndfmxz',
          //   weight: FontWeight.w700,
          // )
        ],
      ),
    );
  }
}
