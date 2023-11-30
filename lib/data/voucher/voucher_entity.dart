class Voucher {
  final String brand;
  final int discount;
  final String image;
  final String description;
  final String expiredDate;

  Voucher({
    required this.brand,
    required this.discount,
    required this.image,
    required this.description,
    required this.expiredDate,
  }) : assert(
          discount >= 0 && discount <= 100,
          'Discount must be in range of 0 - 100 (0% - 100%)',
        );
}
