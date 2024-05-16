import 'package:flutter/material.dart';

mixin FormController {
  final formKey = GlobalKey<FormState>();
  final valueEC = TextEditingController();
  final monthEC = TextEditingController();
  final yaerEC = TextEditingController();
  final monthsRecurrenceEC = TextEditingController();
  final tenantEC = TextEditingController();
  final documentTenantEC = TextEditingController();
  final locatorEC = TextEditingController();
  final documentlocatortEC = TextEditingController();
  final streetEC = TextEditingController();
  final complementEC = TextEditingController();
  final numberEC = TextEditingController();
  final neighborhoodEC = TextEditingController();
  final propertyTypeEC = TextEditingController();
  final cityEC = TextEditingController();
  final stateEC = TextEditingController();
  final zipCodeEC = TextEditingController();
  final observationEC = TextEditingController();
}
