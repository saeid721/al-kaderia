class PaymentModeModel {
  int? success;
  String? message;
  List<PaymentModeData>? data;

  PaymentModeModel({this.success, this.message, this.data});

  PaymentModeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PaymentModeData>[];
      json['data'].forEach((v) {
        data!.add(PaymentModeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentModeData {
  String? fundId;
  String? fundName;
  String? fundDetails;
  String? fundBalanceAmount;
  String? userId;
  String? modifiedBy;
  String? status;
  String? created;
  String? modified;

  PaymentModeData(
      {this.fundId,
        this.fundName,
        this.fundDetails,
        this.fundBalanceAmount,
        this.userId,
        this.modifiedBy,
        this.status,
        this.created,
        this.modified});

  PaymentModeData.fromJson(Map<String, dynamic> json) {
    fundId = json['fund_id'];
    fundName = json['fund_name'];
    fundDetails = json['fund_details'];
    fundBalanceAmount = json['fund_balance_amount'];
    userId = json['user_id'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fund_id'] = fundId;
    data['fund_name'] = fundName;
    data['fund_details'] = fundDetails;
    data['fund_balance_amount'] = fundBalanceAmount;
    data['user_id'] = userId;
    data['modified_by'] = modifiedBy;
    data['status'] = status;
    data['created'] = created;
    data['modified'] = modified;
    return data;
  }
}
