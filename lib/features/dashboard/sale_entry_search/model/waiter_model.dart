class WaiterModel {
  int? success;
  String? message;
  List<Data>? data;

  WaiterModel({this.success, this.message, this.data});

  WaiterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? waiterId;
  String? waiterName;
  String? waiterDetail;
  String? status;
  String? branchId;
  String? userId;
  String? modifiedBy;
  String? created;
  String? modified;

  Data(
      {this.waiterId,
        this.waiterName,
        this.waiterDetail,
        this.status,
        this.branchId,
        this.userId,
        this.modifiedBy,
        this.created,
        this.modified});

  Data.fromJson(Map<String, dynamic> json) {
    waiterId = json['waiter_id'];
    waiterName = json['waiter_name'];
    waiterDetail = json['waiter_detail'];
    status = json['status'];
    branchId = json['branch_id'];
    userId = json['user_id'];
    modifiedBy = json['modified_by'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['waiter_id'] = waiterId;
    data['waiter_name'] = waiterName;
    data['waiter_detail'] = waiterDetail;
    data['status'] = status;
    data['branch_id'] = branchId;
    data['user_id'] = userId;
    data['modified_by'] = modifiedBy;
    data['created'] = created;
    data['modified'] = modified;
    return data;
  }
}
