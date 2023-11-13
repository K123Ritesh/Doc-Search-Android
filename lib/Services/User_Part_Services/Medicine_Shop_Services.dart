import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Models/Models_For_Patient_Part/Medicine_Shop.dart';

class Medicine_Shop_Services {
  Future<List<MedicineShop>?> getMedicineShopsByPincode(
      String city, context) async {
    List<MedicineShop> acc_to_search = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Medicine_Shops')
          .where('city', isEqualTo: city.toLowerCase())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        acc_to_search.assignAll(
          querySnapshot.docs
              .map((shop) => MedicineShop(
                    email: shop['email'],
                    name: shop['name'],
                    pincode: shop['pin_code'],
                    address: shop['address'],
                  ))
              .toList(),
        );
        for (int i = 0; i < acc_to_search.length; i++) {
          print('${i + 1} MEDICINE SHOP');
          print(acc_to_search[i].address);
          print(acc_to_search[i].name);
          print(acc_to_search[i].pincode);
        }
        return acc_to_search;
      } else {
        print('No medicine shops found for pincode $city');
        return null;
      }
    } catch (e) {
      print('Error retrieving medicine shops: $e');
    }
    return null;
  }

  Future<List<MedicineShop>?> famousMedicalShops(context) async {
    List<MedicineShop> famousShops = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Medicine_Shops')
          .where('famous', isEqualTo: true)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        famousShops.assignAll(
          querySnapshot.docs
              .map((shop) => MedicineShop(
                    email: shop['email'],
                    name: shop['name'],
                    pincode: shop['pin_code'],
                    address: shop['address'],
                  ))
              .toList(),
        );

        return famousShops;
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving medicine shops: $e');
    }
    return null;
  }

  Future<String?> uploadPrescriptionToFirebaseStorage(
      context, File file, String userId) async {
    try {
      final folderPath = 'Users/$userId/orders';
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageReference =
          FirebaseStorage.instance.ref('$folderPath/$fileName');

      UploadTask uploadTask = storageReference.putFile(file);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});

      if (taskSnapshot.state == TaskState.success) {
        final downloadURL = await storageReference.getDownloadURL();
        return downloadURL;
      } else {
        return null;
      }
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<void> createOrderDocument(
      context, String userId, String shopId, String prescriptionUrl) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final orderRef = firestore.collection('Orders').doc();

      await orderRef.set({
        'prescription_url': prescriptionUrl,
        'shop_id': shopId,
        'user_id': userId,
        'timestamp': FieldValue.serverTimestamp(),
        'shopName': 'XYZ Medical Store',
        'deliveryStatus': 'Order Done'
      });
      await addToUserOrders(context, userId, orderRef.id);
      print('Order document created successfully.');
    } catch (e) {
      print('Error creating order document: $e');
    }
  }

  Future<void> addToMedicineShop(
      context, String shopId, String prescriptionUrl, String userId) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final shopRef = firestore.collection('Medicine_Shops').doc(shopId);

      final shopData = await shopRef.get();

      if (shopData.exists) {
        final currentPrescriptions =
            List<String>.from(shopData.data()!['prescriptions'] ?? []);
        currentPrescriptions.add("$userId: $prescriptionUrl");

        await shopRef.update({'prescriptions': currentPrescriptions});

        print('Prescription URL added to Medicine Shop successfully.');
      } else {
        print('Shop document does not exist.');
      }
    } catch (e) {
      print('Error adding prescription URL to Medicine Shop: $e');
    }
  }

  Future<void> addToUserOrders(context, String userId, String OrderId) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final shopRef = firestore.collection('Users').doc(userId);

      final shopData = await shopRef.get();

      if (shopData.exists) {
        final currentPrescriptions =
            List<String>.from(shopData.data()!['orders'] ?? []);
        currentPrescriptions.add(OrderId);

        await shopRef.update({'orders': currentPrescriptions});

        print('Order Id added to User Orders successfully.');
      } else {
        print('User document does not exist.');
      }
    } catch (e) {
      print('Error adding OrderId to User Orders: $e');
    }
  }
}
