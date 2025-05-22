class ProductModleherbal {
  final String image;
  final String title;
  String? discription;
  final String price;
  final String condition;
  final String cool;
  bool? isHerbal;
  String? ginger;
  String? lenongrass;
  String? lemonPeels;
  String? licorce;
  String? limonmrytle;
  String? calories;
  String? protein;
  String? fate;
  String? sugar;
  String? old;
  final String discount;
  final String id;
  ProductModleherbal({
    required this.image,
    required this.title,
    this.discription,
    required this.price,
    required this.condition,
    required this.cool,
    this.ginger,
    this.lenongrass,
    this.lemonPeels,
    this.licorce,
    this.limonmrytle,
    this.calories,
    this.protein,
    this.isHerbal,
    this.fate,
    this.sugar,
    this.old,
    required this.discount,
    required this.id,
  });
}

List<ProductModleherbal> myherbalList = [
  ProductModleherbal(
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJtZEE5zxcfq-nAlS_5fJxJrlcjlnxLWOPMQ&s",
    title: "Himalaya Soap Neem & Turm...",
    discription: "Neem & Turm...",
    price: "AED 19.20",
    condition: "Storage Condition",
    cool: "Cool & dry, below 25C",
    ginger: "51%",
    lenongrass: "29%",
    lemonPeels: "10%",
    licorce: "",
    isHerbal: true,
    limonmrytle: "",
    calories: "1 kCal",
    protein: "0.1g",
    fate: "0.1g",
    sugar: "0.1g",
    old: 'AED 24',
    discount: '-20%',
    id: 'herbal_1',
  ),
  ProductModleherbal(
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJtZEE5zxcfq-nAlS_5fJxJrlcjlnxLWOPMQ&s",
    title: "Himalaya Soap Neem & Turm...",
    discription: "Neem & Turm...",
    price: "AED 19.20",
    condition: "Storage Condition",
    cool: "Cool & dry, below 25C",
    ginger: "51%",
    lenongrass: "29%",
    lemonPeels: "10%",
    isHerbal: true,
    licorce: "",
    limonmrytle: "",
    calories: "1 kCal",
    protein: "0.1g",
    fate: "0.1g",
    sugar: "0.1g",
    old: 'AED 24',
    discount: '-20%',
    id: 'herbal_2',
  ),
  ProductModleherbal(
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJtZEE5zxcfq-nAlS_5fJxJrlcjlnxLWOPMQ&s",
    title: "Himalaya Soap Neem & Turm...",
    discription: "Neem & Turm...",
    price: "AED 19.20",
    condition: "Storage Condition",
    cool: "Cool & dry, below 25C",
    ginger: "51%",
    lenongrass: "29%",
    lemonPeels: "10%",
    licorce: "",
    isHerbal: true,
    limonmrytle: "",
    calories: "1 kCal",
    protein: "0.1g",
    fate: "0.1g",
    sugar: "0.1g",
    old: 'AED 24',
    discount: '-20%',
    id: 'herbal_3',
  ),
];
List<ProductModleherbal> myRecomendations = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s",
      title: "Sanita Club Biodegradable",
      price: "AED 25.99",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      old: "",
      isHerbal: false,
      discount: "-9%",
      id: "item_1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s",
      title: "Sanita Club Biodegradable",
      price: "AED 25.99",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      old: "",
      discount: "-9%",
      id: "item_1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s",
      title: "Sanita Club Biodegradable",
      price: "AED 25.99",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      old: "",
      discount: "-9%",
      id: "item_1"),
];
List<ProductModleherbal> milkAndYogurt = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s",
      title: "Al Ain Milk 1L",
      price: "AED 4.25",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 5.00",
      discount: "-15%",
      id: "milk_1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s",
      title: "Al Ain Milk 1L",
      price: "AED 4.25",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 5.00",
      discount: "-15%",
      id: "milk_2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s",
      title: "Al Ain Milk 1L",
      price: "AED 4.25",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      old: "AED 5.00",
      discount: "-15%",
      id: "milk_2"),
];
List<ProductModleherbal> beverages = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWm8nJlEPObT1-XdlBT7CagggnQ4t7pjGFEQ&s",
      title: "Pepsi Can 330ml",
      price: "AED 3.50",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 4.00",
      discount: "-12%",
      id: "bev_1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWm8nJlEPObT1-XdlBT7CagggnQ4t7pjGFEQ&s",
      title: "Pepsi Can 330ml",
      price: "AED 3.50",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      old: "AED 4.00",
      discount: "-12%",
      id: "bev_2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWm8nJlEPObT1-XdlBT7CagggnQ4t7pjGFEQ&s",
      title: "Pepsi Can 330ml",
      price: "AED 3.50",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 4.00",
      discount: "-12%",
      id: "bev_3"),
];
List<ProductModleherbal> bundleOffers = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt4bajQIs2fcjMbvO_qcCiKC2BbDM43CgmSw&s",
      title: "Combo Pasta Pack",
      price: "AED 18.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      old: "AED 22.00",
      discount: "-18%",
      id: "bundle_1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt4bajQIs2fcjMbvO_qcCiKC2BbDM43CgmSw&s",
      title: "Combo Pasta Pack",
      price: "AED 18.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 22.00",
      discount: "-18%",
      id: "bundle_2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt4bajQIs2fcjMbvO_qcCiKC2BbDM43CgmSw&s",
      title: "Combo Pasta Pack",
      price: "AED 18.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 22.00",
      discount: "-18%",
      id: "bundle_3"),
];
List<ProductModleherbal> reducedToClear = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s",
      title: "Choco Cookies (Expiring Soon)",
      price: "AED 5.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 10.00",
      discount: "-50%",
      id: "clear_1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s",
      title: "Choco Cookies (Expiring Soon)",
      price: "AED 5.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      old: "AED 10.00",
      discount: "-50%",
      id: "clear_2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s",
      title: "Choco Cookies (Expiring Soon)",
      price: "AED 5.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 10.00",
      discount: "-50%",
      id: "clear_3"),
];
List<ProductModleherbal> mangoes = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkEbYmomBlqAHgrep6gH24ZgGnkRsK0mk9Dw&s",
      title: "Alphonso Mango Premium Box",
      price: "AED 19.20",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      old: "AED 24",
      discount: "-20%",
      id: "mango1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkEbYmomBlqAHgrep6gH24ZgGnkRsK0mk9Dw&s",
      title: "Alphonso Mango Premium Box",
      price: "AED 19.20",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 24",
      discount: "-20%",
      id: "mango2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkEbYmomBlqAHgrep6gH24ZgGnkRsK0mk9Dw&s",
      title: "Alphonso Mango Premium Box",
      price: "AED 19.20",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      old: "AED 24",
      isHerbal: false,
      discount: "-20%",
      id: "mango3"),
];
List<ProductModleherbal> mostLoved = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSgYoY-mxL8X2G2cF1okBsFDc_EqIjhTsznw&s",
      title: "Alphonso Mango Premium Box",
      price: "AED 19.20",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      old: "AED 19.20",
      discount: "-20%",
      id: "loved1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSgYoY-mxL8X2G2cF1okBsFDc_EqIjhTsznw&s",
      title: "Alphonso Mango Premium Box",
      price: "AED 19.20",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      old: "AED 19.20",
      isHerbal: false,
      discount: "-20%",
      id: "loved2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSgYoY-mxL8X2G2cF1okBsFDc_EqIjhTsznw&s",
      title: "Alphonso Mango Premium Box",
      price: "AED 19.20",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      old: "AED 19.20",
      discount: "-20%",
      id: "loved3"),
];
List<ProductModleherbal> liquid = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrW9Qy1nHncu5WHJXEY2I2JIpueTABoNECSg&s",
      title: "Omo Active Detergent Liquid 2L",
      price: "AED 25.99",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-20%",
      id: "liquid1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrW9Qy1nHncu5WHJXEY2I2JIpueTABoNECSg&s",
      title: "Omo Active Detergent Liquid 2L",
      price: "AED 25.99",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      discount: "-20%",
      id: "liquid2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrW9Qy1nHncu5WHJXEY2I2JIpueTABoNECSg&s",
      title: "Omo Active Detergent Liquid 2L",
      price: "AED 25.99",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      discount: "-20%",
      id: "liquid3"),
];
List<ProductModleherbal> powder = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQajfjQ7QBehnOBrEorTgSmy7w0cm5Cfa2_Kg&s",
      title: "Ariel Original Detergent Powder 2.5kg",
      price: "AED 19.20",
      old: "AED 24",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-20%",
      id: "powder1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQajfjQ7QBehnOBrEorTgSmy7w0cm5Cfa2_Kg&s",
      title: "Ariel Original Detergent Powder 2.5kg",
      price: "AED 19.20",
      old: "AED 24",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-20%",
      id: "powder3"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQajfjQ7QBehnOBrEorTgSmy7w0cm5Cfa2_Kg&s",
      title: "Ariel Original Detergent Powder 2.5kg",
      price: "AED 19.20",
      old: "AED 24",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-20%",
      id: "powder3"),
];
List<ProductModleherbal> toab = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrX1lI7ToaPINYCMPVfOzG2MmSaFE8WvXIw&s",
      title: "Finish Powerball Dishwasher Tabs (20 pcs)",
      price: "AED 3.50",
      old: "AED 4.00",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-12%",
      id: "tab1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrX1lI7ToaPINYCMPVfOzG2MmSaFE8WvXIw&s",
      title: "Finish Powerball Dishwasher Tabs (20 pcs)",
      price: "AED 3.50",
      old: "AED 4.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      discount: "-12%",
      id: "tab2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrX1lI7ToaPINYCMPVfOzG2MmSaFE8WvXIw&s",
      title: "Finish Powerball Dishwasher Tabs (20 pcs)",
      price: "AED 3.50",
      old: "AED 4.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-12%",
      id: "tab3"),
];
List<ProductModleherbal> surfaceCleaners = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBA_5tGd8AqriWNeJuHb3GtpgwDg6wKNjxpw&s",
      title: "Dettol Surface Cleaner 1L",
      price: "AED 18.00",
      isHerbal: false,
      old: "AED 22.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-18%",
      id: "surface1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBA_5tGd8AqriWNeJuHb3GtpgwDg6wKNjxpw&s",
      title: "Dettol Surface Cleaner 1L",
      price: "AED 18.00",
      old: "AED 22.00",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-18%",
      id: "surface2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBA_5tGd8AqriWNeJuHb3GtpgwDg6wKNjxpw&s",
      title: "Dettol Surface Cleaner 1L",
      price: "AED 18.00",
      old: "AED 22.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-18%",
      id: "surface3"),
];
List<ProductModleherbal> stainRemover = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2tBFi8uRkBdYEyV8aJlZXTKaUaKBlryl93A&s",
      title: "Vanish Oxi Action Powder 500g",
      price: "AED 5.00",
      isHerbal: false,
      old: "AED 10.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-50%",
      id: "stain1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2tBFi8uRkBdYEyV8aJlZXTKaUaKBlryl93A&s",
      title: "Vanish Oxi Action Powder 500g",
      price: "AED 5.00",
      old: "AED 10.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-50%",
      id: "stain2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2tBFi8uRkBdYEyV8aJlZXTKaUaKBlryl93A&s",
      title: "Vanish Oxi Action Powder 500g",
      price: "AED 5.00",
      old: "AED 10.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      discount: "-50%",
      id: "stain3"),
];
List<ProductModleherbal> fabricSoftners = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo8XrC4NRGPNfV83R5BxqYtvg8xNskiTInTg&s",
      title: "Comfort Fabric Softener Blue 1L",
      price: "AED 4.25",
      old: "AED 5.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-15%",
      id: "fabric1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo8XrC4NRGPNfV83R5BxqYtvg8xNskiTInTg&s",
      title: "Comfort Fabric Softener Blue 1L",
      price: "AED 4.25",
      old: "AED 5.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-15%",
      id: "fabric2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo8XrC4NRGPNfV83R5BxqYtvg8xNskiTInTg&s",
      title: "Comfort Fabric Softener Blue 1L",
      price: "AED 4.25",
      old: "AED 5.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      discount: "-15%",
      id: "fabric3"),
];
List<ProductModleherbal> items = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s",
      title: "Sanita Club Biodegradable",
      price: "AED 25.99",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-9%",
      id: "item1"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s",
      title: "Sanita Club Biodegradable",
      price: "AED 25.99",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-9%",
      id: "item2"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s",
      title: "Sanita Club Biodegradable",
      price: "AED 25.99",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-9%",
      id: "item3"),
];
List<ProductModleherbal> daipers = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTycPxb70Yu6ww3l0b85CtvcOYCxa468tgY_g&s",
      title: "Pampers Premium Care Size 3 (58 pcs)",
      price: "AED 25.99",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-9%",
      id: "101"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTycPxb70Yu6ww3l0b85CtvcOYCxa468tgY_g&s",
      title: "Pampers Premium Care Size 3 (58 pcs)",
      price: "AED 25.99",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      discount: "-9%",
      id: "102"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTycPxb70Yu6ww3l0b85CtvcOYCxa468tgY_g&s",
      title: "Pampers Premium Care Size 3 (58 pcs)",
      price: "AED 25.99",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      isHerbal: false,
      discount: "-9%",
      id: "103"),
];
List<ProductModleherbal> babyBath = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPeH9Zji50jD_pss2wmvPgQYETYgnv7iFtpA&s",
      title: "Johnson’s Baby Bath 500ml",
      price: "AED 19.20",
      old: "AED 24",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-20%",
      id: "201"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPeH9Zji50jD_pss2wmvPgQYETYgnv7iFtpA&s",
      title: "Johnson’s Baby Bath 500ml",
      price: "AED 19.20",
      isHerbal: false,
      old: "AED 24",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-20%",
      id: "202"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPeH9Zji50jD_pss2wmvPgQYETYgnv7iFtpA&s",
      title: "Johnson’s Baby Bath 500ml",
      price: "AED 19.20",
      old: "AED 24",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-20%",
      id: "203"),
];
List<ProductModleherbal> babyCare = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEV5qK-KIb0HWUenN0enHWQsiKM5hlChpLWw&s",
      title: "Johnson’s Baby Lotion 500ml",
      price: "AED 14.50",
      old: "AED 18.00",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-19%",
      id: "301"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEV5qK-KIb0HWUenN0enHWQsiKM5hlChpLWw&s",
      title: "Johnson’s Baby Lotion 500ml",
      price: "AED 14.50",
      old: "AED 18.00",
      condition: "Storage Condition",
      isHerbal: false,
      cool: "Cool & dry, below 25C",
      discount: "-19%",
      id: "302"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEV5qK-KIb0HWUenN0enHWQsiKM5hlChpLWw&s",
      title: "Johnson’s Baby Lotion 500ml",
      price: "AED 14.50",
      old: "AED 18.00",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-19%",
      id: "303"),
];
List<ProductModleherbal> babyFood = [
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5W_woOKQPX7F3AkdIIhVt3n2GXkdYnMZ6Q&s",
      title: "Gerber Rice Cereal 227g",
      price: "AED 15.00",
      isHerbal: false,
      old: "AED 18.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-17%",
      id: "401"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5W_woOKQPX7F3AkdIIhVt3n2GXkdYnMZ6Q&s",
      title: "Gerber Rice Cereal 227g",
      price: "AED 15.00",
      isHerbal: false,
      old: "AED 18.00",
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-17%",
      id: "402"),
  ProductModleherbal(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5W_woOKQPX7F3AkdIIhVt3n2GXkdYnMZ6Q&s",
      title: "Gerber Rice Cereal 227g",
      price: "AED 15.00",
      old: "AED 18.00",
      isHerbal: false,
      condition: "Storage Condition",
      cool: "Cool & dry, below 25C",
      discount: "-17%",
      id: "403"),
];
