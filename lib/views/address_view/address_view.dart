import 'package:cryptop/views/address_view/widgets/address_body.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  var top = false;
  var check = false;
  var id = '1';

  setId(value) => {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: markers![MarkerId(value)]!.position,
              zoom: 14.5,
              tilt: 50.0,
            ),
          ),
        ),
        setTop(false)
      };
  setTop(value) => setState(() => top = value);
  setCheck(value) => setState(() => check = value);
  setController(value) => setState(() => mapController = value);
  setCenter(LatLng value) => setState(
        () {
          markers![const MarkerId('center')] = Marker(
            markerId: const MarkerId('center'),
            position: value,
          );
        },
      );
  setTitle(value) => {titleController.text = value};
  setDescription(value) => descriptionController.text = value;
  void add() {
    setState(() {
      final keys = markers!.keys.toList();
      final value = int.parse(keys[keys.length - 1].value);

      final id = MarkerId((value + 1).toString());
      markers![id] = Marker(
        markerId: id,
        position: markers![const MarkerId('center')]!.position,
        infoWindow: InfoWindow(
            title: titleController.text, snippet: descriptionController.text),
      );
    });
    Navigator.pop(context);
  }

  void edit(ids, title, desc) {
    setState(() {
      final id = MarkerId(ids.toString());
      markers![id] = Marker(
        markerId: id,
        position: markers![id]!.position,
        infoWindow: InfoWindow(title: title, snippet: desc),
      );
    });
    Navigator.pop(context);
  }

  void delete(id) {
    setState(() {
      markers!.remove(MarkerId(id));
    });
  }

  GoogleMapController? mapController;

  Map<MarkerId, Marker>? markers = {
    const MarkerId('center'): const Marker(
      markerId: MarkerId('center'),
      position: LatLng(31.5, 34.6),
      infoWindow: InfoWindow(title: '', snippet: ''),
    ),
    const MarkerId('0'): const Marker(
      markerId: MarkerId('0'),
      position: LatLng(35.5, 34.6),
      infoWindow: InfoWindow(title: 'Home', snippet: 'Lorem tako sekf gjreg'),
    ),
    const MarkerId('1'): const Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.5, 131.6),
      infoWindow: InfoWindow(title: 'Job', snippet: 'Lorem tako sekf gjreg'),
    ),
    const MarkerId('2'): const Marker(
      markerId: MarkerId('2'),
      position: LatLng(34.5, 36.6),
      infoWindow: InfoWindow(title: 'Office', snippet: 'Lorem tako sekf gjreg'),
    ),
  };
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AddressBody(
              markers: markers!,
              setTop: setTop,
              top: top,
              setId: setId,
              id: id,
              setCheck: setCheck,
              check: check,
              setController: setController,
              controller: mapController,
              setTitle: setTitle,
              titleController: titleController,
              setDescription: setDescription,
              descriptionController: descriptionController,
              add: add,
              delete: delete,
              edit: edit,
              setCenter: setCenter,
            ),
          ),
        ],
      ),
    );
  }
}
