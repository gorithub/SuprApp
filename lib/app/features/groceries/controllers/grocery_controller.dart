import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:suprapp/app/features/groceries/models/grocery_model.dart';
import 'package:uuid/uuid.dart';

class GroceryProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  String userid = Uuid().v4();
  Future<String> addGrocery({
    required String categoryName,
    required String subcategoryName,
    required File subcategoryImage,
    required String productName,
    required Product productDetails,
    required List<File> additionalProductImages,
  }) async {
    try {
      String sanitizedCategory =
          categoryName.replaceAll(RegExp(r'[.#$/\[\]]'), '_');
      String sanitizedSubcategory =
          subcategoryName.replaceAll(RegExp(r'[.#$/\[\]]'), '_');
      String sanitizedProductName =
          productName.replaceAll(RegExp(r'[.#$/\[\]]'), '_');
      final groceryRef = _firestore.collection('Grocery');
      final categoryRef = groceryRef.doc(sanitizedCategory);
      final subcategoryRef = categoryRef.collection(sanitizedSubcategory).doc();
      final String subcategoryImageUrl =
          await _uploadImage(subcategoryImage, 'subcategories');
      await subcategoryRef.set({
        'name': subcategoryName,
        'id': Uuid().v4(),
        'imageUrl': subcategoryImageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });
      final productRef = subcategoryRef.collection(sanitizedProductName).doc();
      final String mainProductImageUrl =
          await _uploadImage(subcategoryImage, 'products');
      final List<String> additionalImageUrls = [];
      for (final file in additionalProductImages) {
        final url = await _uploadImage(file, 'product_details');
        additionalImageUrls.add(url);
      }
      final productWithImages = productDetails.copyWith(
        imageUrls: [mainProductImageUrl, ...additionalImageUrls],
      );
      await productRef.set({
        ...productWithImages.toMap(),
        'name': productName,
        'id': Uuid().v4(), // Unique ID for product
        'createdAt': FieldValue.serverTimestamp(),
      });

      notifyListeners();
      return productName;
    } catch (e) {
      throw Exception('Failed to add grocery: $e');
    }
  }

  Future<String> _uploadImage(File file, String folderName) async {
    try {
      final String fileName =
          '${DateTime.now().millisecondsSinceEpoch}${path.extension(file.path)}';
      final Reference ref = _storage.ref().child('$folderName/$fileName');
      final UploadTask uploadTask = ref.putFile(file);
      final TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
}
