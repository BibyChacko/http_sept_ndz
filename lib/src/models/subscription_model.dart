
class SubscriptionModel{
  String? id;
  String subscriptionName;
  int subscriptionDays;
  double amount;

  SubscriptionModel({
      this.id,required this.subscriptionName,required this.subscriptionDays,required this.amount});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json["_id"],
      subscriptionName: json["subscriptionName"],
      subscriptionDays: int.parse(json["subscriptionDays"]),
      amount: double.parse(json["amount"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subscriptionName": this.subscriptionName,
      "subscriptionDays": this.subscriptionDays,
      "amount": this.amount,
    };
  }
}