class Category {
  final String id;
  final String name;
  final DateTime createdAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}

// lib/models/subcategory_model.dart
class Subcategory {
  final String id;
  final String name;

  final String imageUrl;
  final String categoryId;
  final DateTime createdAt;

  Subcategory({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Subcategory.fromMap(Map<String, dynamic> map) {
    return Subcategory(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      categoryId: map['categoryId'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}

// lib/models/product_model.dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String weight;
  final String expiryDate;
  final String status;
  final double discount;
  final int stockLevel;
  final String categoryId;
  final String subcategoryId;
  final List<String> imageUrls;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.weight,
    required this.expiryDate,
    required this.status,
    required this.discount,
    required this.stockLevel,
    required this.categoryId,
    required this.subcategoryId,
    required this.imageUrls,
    required this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      weight: map['weight'] ?? '',
      expiryDate: map['expiryDate'] ?? '',
      status: map['status'] ?? 'Active',
      discount: (map['discount'] ?? 0).toDouble(),
      stockLevel: map['stockLevel'] ?? 0,
      categoryId: map['categoryId'] ?? '',
      subcategoryId: map['subcategoryId'] ?? '',
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'weight': weight,
      'expiryDate': expiryDate,
      'status': status,
      'discount': discount,
      'stockLevel': stockLevel,
      'categoryId': categoryId,
      'subcategoryId': subcategoryId,
      'imageUrls': imageUrls,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? weight,
    String? expiryDate,
    String? status,
    double? discount,
    int? stockLevel,
    String? categoryId,
    String? subcategoryId,
    List<String>? imageUrls,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      weight: weight ?? this.weight,
      expiryDate: expiryDate ?? this.expiryDate,
      status: status ?? this.status,
      discount: discount ?? this.discount,
      stockLevel: stockLevel ?? this.stockLevel,
      categoryId: categoryId ?? this.categoryId,
      subcategoryId: subcategoryId ?? this.subcategoryId,
      imageUrls: imageUrls ?? this.imageUrls,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class Shop {
  final String id;
  final String name;
  final String imageUrl;
  final DateTime createdAt;

  Shop({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}
