// Text(add_commas_to_price(1250000)); // يظهر "1,250,000"
String addCommasToPrice(int price) => price.toString().replaceAllMapped(
  RegExp(r'\B(?=(\d{3})+(?!\d))'),
  (_) => ',',
);
