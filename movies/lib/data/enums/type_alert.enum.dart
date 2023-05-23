import 'package:flutter/material.dart';
import 'package:movies/data/models/type_alert_generic_model.dart';

enum TypeAlertDialog {
  success(TypeAlertGenericModel(
    icon: Icons.check_circle,
    color: Colors.green,
  )),
  warning(TypeAlertGenericModel(
    icon: Icons.warning,
    color: Colors.amber,
  )),
  error(TypeAlertGenericModel(
    icon: Icons.cancel,
    color: Colors.red,
  ));

  const TypeAlertDialog(this.value);
  final TypeAlertGenericModel value;
}
