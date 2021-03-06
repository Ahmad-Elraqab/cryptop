import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:flutter/material.dart';
import 'smart_trade_list_item_body.dart';

class SmartTradeList extends StatelessWidget {
  const SmartTradeList({
    Key? key,
    this.setIndex,
    this.activeIndex,
    this.smartTradeList,
  }) : super(key: key);

  final List<SmartTradeModel>? smartTradeList;
  final Function? setIndex;
  final int? activeIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: smartTradeList == null
          ? LoadingAnimation()
          : smartTradeList!.isEmpty
              ? Center(
                  child: SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset('lib/assets/logo.png'),
                  ),
                )
              : ListView.builder(
                  itemCount: smartTradeList!.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => setIndex!(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                      child: Column(
                        children: [
                          activeIndex == index
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextComponent(
                                      align: TextAlign.start,
                                      fontSize: 14.0,
                                      line: 1,
                                      textColor: Colors.white,
                                      title: smartTradeList![index]
                                          .title
                                          .toString(),
                                      weight: FontWeight.bold,
                                    ),
                                    activeIndex == index
                                        ? const SizedBox()
                                        : CustomButtom(
                                            borderColor: Colors.transparent,
                                            borderRadius: 5.0,
                                            buttonColor: smartTradeList![index]
                                                        .isActive ==
                                                    false
                                                ? Colors.grey
                                                : Colors.amber,
                                            buttonText: smartTradeList![index]
                                                        .isActive ==
                                                    false
                                                ? 'inActive'
                                                : 'Active',
                                            buttonTextColor: Colors.white,
                                            fontSize: 12,
                                            hasImage: false,
                                            height: 30.0,
                                            horizontal: 10.0,
                                            vertical: 4.0,
                                            imageUrl: '',
                                            onTap: () => {},
                                          ),
                                  ],
                                ),
                          activeIndex == index
                              ? SmartTradeListItemBody(
                                  activeIndex: activeIndex,
                                  smartTrade: smartTradeList![index],
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
