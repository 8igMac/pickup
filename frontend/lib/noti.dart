enum NotiType {
  driverMatched,
  passengerMatched,
  gift,
  newFriend,
  driverStarted,
  driverFinishd,
}

class Noti {
  final NotiType type;
  final String content;

  Noti({required this.type, required this.content});

  factory Noti.fromJson(Map<String, dynamic> json) {
    late NotiType type;

    switch (json['type']) {
      case 'gift':
        type = NotiType.gift;
        break;
      case 'newFriend':
        type = NotiType.newFriend;
        break;
      case 'driverFinished':
        type = NotiType.driverFinishd;
        break;
      case 'driverMatched':
        type = NotiType.driverMatched;
        break;
      case 'driverStarted':
        type = NotiType.driverStarted;
        break;
      case 'passengerMatched':
        type = NotiType.passengerMatched;
        break;
      default:
        type = NotiType.gift;
    }
    return Noti(
      type: type,
      content: json['content'],
    );
  }
}
