import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/address_view/widgets/address_edit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressLine extends StatelessWidget {
  final Function? onClick;
  final Function? delete;
  final Function? setTitle;
  final Function? setDescription;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final Function? edit;
  final String? index;
  final String? snippet;
  final String? title;

  const AddressLine({
    Key? key,
    this.onClick,
    this.index,
    this.delete,
    this.snippet,
    this.title,
    this.edit,
    this.setTitle,
    this.setDescription,
    this.titleController,
    this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick!(index!),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color.fromRGBO(36, 36, 43, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextComponent(
              align: TextAlign.start,
              fontSize: 14,
              line: 1,
              textColor: Colors.white,
              title: title! + ', ' + snippet!,
              weight: FontWeight.w600,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: IconButton(
                    onPressed: () => showBottomSheet(
                      context: context,
                      builder: (context) => AddressEdit(
                        title: title,
                        index: index,
                        description: snippet,
                        edit: edit,
                        setDescription: setDescription!,
                        setTitle: setTitle!,
                        descriptionController: descriptionController!,
                        titleController: titleController!,
                      ),
                    ),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: IconButton(
                    onPressed: () => delete!(index!),
                    icon: const Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.times,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
