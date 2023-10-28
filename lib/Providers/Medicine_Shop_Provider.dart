import 'dart:io';

import 'package:doc_search/Models/Medicine_Shop.dart';
import 'package:doc_search/Services/Medicine_Shop_Services.dart';
import 'package:flutter/material.dart';

class Medicine_Shop_Provider with ChangeNotifier {
  late List<MedicineShop>? acc_to_Search;
  bool isLoading = false;

  Medicine_Shop_Services service = Medicine_Shop_Services();

  getAccToSearch(String city, context) async {
    isLoading = true;
    acc_to_Search = await service.getMedicineShopsByPincode(city, context);
    isLoading = false;
    notifyListeners();
  }

  String? downloadURL = null;

  uploadPrescription(context, File selectedFile, String userId) async {
    downloadURL = (await service.uploadPrescriptionToFirebaseStorage(
        context, selectedFile, userId))!;
    notifyListeners();
  }

  createOrderDocument(
      context, String userId, String shopId, String prescriptionUrl) async {
    await service.createOrderDocument(context, userId, shopId, prescriptionUrl);
    notifyListeners();
  }

  addToMedicineShop(
      context, String shopId, String prescriptionUrl, String userId) async {
    await service.addToMedicineShop(context, shopId, prescriptionUrl, userId);
    notifyListeners();
  }
}
