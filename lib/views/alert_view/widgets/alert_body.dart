import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/views/alert_view/widgets/alert_header.dart';
import 'package:cryptop/views/alert_view/widgets/alert_list.dart';
import 'package:flutter/material.dart';

class AlertBody extends StatelessWidget {
  const AlertBody(
      {Key? key,
      this.activeIndex,
      this.setIndex,
      this.create,
      this.edit,
      this.delete,
      this.status})
      : super(key: key);
  final int? activeIndex;
  final Function? setIndex;
  final Function? create;
  final Function? edit;
  final Function? delete;
  final Function? status;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        const TitleHeader(
          isTitle: true,
          title: 'Alerts',
        ),
        const SizedBox(height: 20.0),
        AlertHeader(filter: create),
        AlertList(
          activeIndex: activeIndex,
          setIndex: setIndex,
          edit: edit,
          delete: delete,
          status: status,
        ),
      ],
    );
  }
}
