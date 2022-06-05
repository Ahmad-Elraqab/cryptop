import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/alert_model.dart';
import 'package:cryptop/viewmodels/alert_viewmodel/alert_action.dart';
import 'package:cryptop/views/alert_view/widgets/alert_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AlertList extends StatelessWidget {
  const AlertList({
    Key? key,
    this.setIndex,
    this.activeIndex,
    this.alerts,
  }) : super(key: key);

  final Function? setIndex;
  final List<Alert>? alerts;
  final int? activeIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: alerts!.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => setIndex!(index),
          child: Slidable(
            key: Key(index.toString()),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 1,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomButtom(
                          borderColor: Colors.transparent,
                          borderRadius: 5.0,
                          buttonColor: Colors.grey,
                          buttonText: 'Edit',
                          buttonTextColor: Colors.white,
                          fontSize: 12,
                          hasImage: false,
                          height: 30.0,
                          horizontal: 20.0,
                          vertical: 4.0,
                          imageUrl: '',
                          onTap: () => {
                            showBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) =>
                                  AlertBottomSheet(alert: alerts![index]),
                            ),
                          },
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: CustomButtom(
                          borderColor: Colors.transparent,
                          borderRadius: 5.0,
                          buttonColor: Colors.grey,
                          buttonText: 'Delete',
                          buttonTextColor: Colors.white,
                          fontSize: 12,
                          hasImage: false,
                          height: 30.0,
                          horizontal: 20.0,
                          vertical: 4.0,
                          imageUrl: '',
                          onTap: () async {
                            final data = await context.read(
                                deleteAlert(alerts![index].id.toString())
                                    .future);
                            if (data != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(network_snackBar(0));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(network_snackBar(1));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: alerts![index].symbol.toString(),
                      weight: FontWeight.bold,
                    ),
                  ),
                  dot(),
                  Expanded(
                    flex: 1,
                    child: TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: alerts![index].type.toString(),
                      weight: FontWeight.bold,
                    ),
                  ),
                  dot(),
                  Expanded(
                    child: TextComponent(
                      align: TextAlign.start,
                      fontSize: 14.0,
                      line: 1,
                      textColor: Colors.white,
                      title: alerts![index].value.toString(),
                      weight: FontWeight.bold,
                    ),
                  ),
                  CustomButtom(
                    borderColor: Colors.transparent,
                    borderRadius: 5.0,
                    buttonColor: alerts![index].status == false
                        ? Colors.grey
                        : Colors.amber,
                    buttonText:
                        alerts![index].status == false ? 'inActive' : 'Active',
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
            ),
          ),
        ),
      ),
    );
  }

  Expanded dot() {
    return Expanded(
      child: Center(
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
