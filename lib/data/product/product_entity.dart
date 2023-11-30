class Product {
  final String name;
  final String image;
  final String price;

  final int discount;
  final int installment;

  Product({
    this.discount = 0,
    this.installment = 0,
    required this.name,
    required this.image,
    required this.price,
  })  : assert(
          discount >= 0 && discount <= 100,
          'Discount must be in range of 0 - 100 (0% - 100%)',
        ),
        assert(
          installment >= 0 && installment <= 100,
          'Installment must be in range of 0 - 100 (0% - 100%)',
        );
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

  final PhoneSpecs specs;

  Phone({
    required String name,
    required String image,
    required this.availableStorage,
    required this.storage,
    int discount = 0,
    int installment = 0,
    required String price,
    required this.specs,
  })  : assert(
          availableStorage.contains(storage),
          'Storage must be in available_storage list',
        ),
        super(
          name: name,
          image: image,
          price: price,
          discount: discount,
          installment: installment,
        );
}
