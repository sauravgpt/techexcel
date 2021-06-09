enum ConnectionType { Mobile, Wifi }

enum Time { Day, Night }

dayOrNight() {
  final currTime = DateTime.now().hour;
  if (currTime >= 6 && currTime <= 18) return Time.Day;

  return Time.Night;
}
