import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class WalletDetail extends StatelessWidget {
  const WalletDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                title: 'Wallet Details',
                weight: FontWeight.bold,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: 'BTCUSDT',
                      weight: FontWeight.bold,
                    ),
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: '25',
                      weight: FontWeight.bold,
                    ),
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    const TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: '106,451.15',
                      weight: FontWeight.bold,
                    ),
                    CustomButtom(
                      borderColor: Colors.transparent,
                      borderRadius: 5.0,
                      buttonColor: const Color.fromARGB(255, 250, 131, 125),
                      buttonText: '9.45%',
                      buttonTextColor: Colors.white,
                      fontSize: 14.0,
                      hasImage: false,
                      height: 30.0,
                      horizontal: 20.0,
                      vertical: 4.0,
                      imageUrl: '',
                      onTap: () => {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
