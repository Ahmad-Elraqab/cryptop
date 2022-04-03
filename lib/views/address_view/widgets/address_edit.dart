import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit({
    Key? key,
    this.edit,
    this.title,
    this.description,
    this.index,
    this.setTitle,
    this.setDescription,
    this.titleController,
    this.descriptionController,
  }) : super(key: key);

  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final Function? setTitle;
  final Function? setDescription;
  final Function? edit;
  final String? index;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    titleController!.text = title!;
    descriptionController!.text = description!;

    return Container(
      padding: const EdgeInsets.all(30.0),
      height: 300.0,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(36, 36, 43, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          CustomerTextField(
            borderColor: Colors.white,
            color: Colors.white,
            labelText: 'Title',
            lines: 2,
            onChanged: setTitle!,
            readonly: false,
            secure: false,
            validate: false,
            error: 'error',
            controller: titleController,
          ),
          CustomerTextField(
            borderColor: Colors.white,
            color: Colors.white,
            labelText: 'Description',
            lines: 2,
            onChanged: setDescription!,
            readonly: false,
            secure: false,
            validate: false,
            error: 'error',
            controller: descriptionController,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: IconButton(
                  onPressed: () => edit!(index, titleController!.text,
                      descriptionController!.text),
                  icon: const Icon(
                    FontAwesomeIcons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.times,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
