import 'package:flutter/material.dart';
import 'package:rentease/OwnerUI/Pages/vacancies.dart';
import 'package:rentease/PropertyList/Provider/property_list.dart';
import 'package:rentease/PropertyList/Model/property_model.dart';

PropertyModel? vacancy;
PropertyList propertyList = PropertyList();
final formKey = GlobalKey<FormState>();
final _descriptionController = TextEditingController();
final _addressController = TextEditingController();
final _roomController = TextEditingController();
final _bathController = TextEditingController();
final _rentController = TextEditingController();
final _areaController = TextEditingController();
final _categoryController = TextEditingController();
final _titleController = TextEditingController();

addVacancy() {
  if (formKey.currentState!.validate()) {
    void addVacancy() {
      vacancy = PropertyModel(
        description: _descriptionController.text,
        address: _addressController.text,
        rooms: _roomController.text,
        baths: _bathController.text,
        rent: _rentController.text,
        area: _areaController.text,
        category: _categoryController.text,
        title: _titleController.text,
      );
      propertyList.addVacancy(vacancy!);
    }
  }
}
