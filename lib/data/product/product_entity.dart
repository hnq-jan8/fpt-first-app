class Product {
  final String name;
  final String image;
  final String price;

  Product({
    required this.name,
    required this.image,
    required this.price,
  });
}

class PhoneSpecs {
  final String cpu;
  final String screenSize;
  final String storage;

  PhoneSpecs(this.cpu, this.screenSize, this.storage);
}

class Phone extends Product {
  final List<String> availableStorage;

  final String storage;

  final double discount;

  final PhoneSpecs specs;

  Phone({
    required this.specs,
    required this.availableStorage,
    required this.storage,
    this.discount = 0,
    required String name,
    required String image,
    required String price,
  })  : assert(
          discount >= 0 && discount <= 1,
          'Discount must be in range of 0 - 1 (0% - 100%)',
        ),
        assert(
          availableStorage.contains(storage),
          'Storage must be in available_storage list',
        ),
        super(
          name: name,
          image: image,
          price: price,
        );
}
