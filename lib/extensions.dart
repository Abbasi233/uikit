extension DateToString on DateTime {
  String formatWithMonthName() {
    List<String> months = ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"];
    try {
      return "${day.toString().padLeft(2, '0')} ${months[month]} $year ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return e.toString();
    }
  }

  String formatToString({bool withHour = false}) {
    try {
      return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year${withHour ? " ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}" : ""}";
    } catch (e) {
      return e.toString();
    }
  }
}

extension StringToDate on String {
  DateTime formatToDate() {
    var items = split("/");
    return DateTime(int.parse(items[2]), int.parse(items[1]), int.parse(items[0]));
  }
}
