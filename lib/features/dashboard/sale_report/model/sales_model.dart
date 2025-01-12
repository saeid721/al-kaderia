class SalesModel {
  int? success;
  String? message;
  SalesData? data;

  SalesModel({this.success, this.message, this.data});

  SalesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? SalesData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SalesData {
  String? billNo;
  String? totalQty;
  String? grandAmount;
  String? discountAmount;
  String? flatDiscountAmount;
  String? percentageDiscount;
  String? vatAmount;
  String? totalAmount;
  String? payableAmount;
  String? paidAmount;
  String? paymentMethod;
  String? paymentMethodAnother;
  String? changeAmount;
  String? token;
  String? orderType;
  String? waiterId;
  String? orderNote;
  String? userId;
  int? customerId;
  String? branchId;
  String? modifiedBy;
  String? salesDate;
  String? salesTime;
  String? pointThisInvoice;
  String? pointAmountUse;
  String? totalGiftPoint;

  SalesData(
      {this.billNo,
        this.totalQty,
        this.grandAmount,
        this.discountAmount,
        this.flatDiscountAmount,
        this.percentageDiscount,
        this.vatAmount,
        this.totalAmount,
        this.payableAmount,
        this.paidAmount,
        this.paymentMethod,
        this.paymentMethodAnother,
        this.changeAmount,
        this.token,
        this.orderType,
        this.waiterId,
        this.orderNote,
        this.userId,
        this.customerId,
        this.branchId,
        this.modifiedBy,
        this.salesDate,
        this.salesTime,
        this.pointThisInvoice,
        this.pointAmountUse,
        this.totalGiftPoint});

  SalesData.fromJson(Map<String, dynamic> json) {
    billNo = json['bill_no'];
    totalQty = json['total_qty'];
    grandAmount = json['grand_amount'];
    discountAmount = json['discount_amount'];
    flatDiscountAmount = json['flat_discount_amount'];
    percentageDiscount = json['percentage_discount'];
    vatAmount = json['vat_amount'];
    totalAmount = json['total_amount'];
    payableAmount = json['payable_amount'];
    paidAmount = json['paid_amount'];
    paymentMethod = json['payment_method'];
    paymentMethodAnother = json['payment_method_another'];
    changeAmount = json['change_amount'];
    token = json['token'];
    orderType = json['order_type'];
    waiterId = json['waiter_id'];
    orderNote = json['order_note'];
    userId = json['user_id'];
    customerId = json['customer_id'];
    branchId = json['branch_id'];
    modifiedBy = json['modified_by'];
    salesDate = json['sales_date'];
    salesTime = json['sales_time'];
    pointThisInvoice = json['point_this_invoice'];
    pointAmountUse = json['point_amount_use'];
    totalGiftPoint = json['total_gift_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bill_no'] = billNo;
    data['total_qty'] = totalQty;
    data['grand_amount'] = grandAmount;
    data['discount_amount'] = discountAmount;
    data['flat_discount_amount'] = flatDiscountAmount;
    data['percentage_discount'] = percentageDiscount;
    data['vat_amount'] = vatAmount;
    data['total_amount'] = totalAmount;
    data['payable_amount'] = payableAmount;
    data['paid_amount'] = paidAmount;
    data['payment_method'] = paymentMethod;
    data['payment_method_another'] = paymentMethodAnother;
    data['change_amount'] = changeAmount;
    data['token'] = token;
    data['order_type'] = orderType;
    data['waiter_id'] = waiterId;
    data['order_note'] = orderNote;
    data['user_id'] = userId;
    data['customer_id'] = customerId;
    data['branch_id'] = branchId;
    data['modified_by'] = modifiedBy;
    data['sales_date'] = salesDate;
    data['sales_time'] = salesTime;
    data['point_this_invoice'] = pointThisInvoice;
    data['point_amount_use'] = pointAmountUse;
    data['total_gift_point'] = totalGiftPoint;
    return data;
  }
}
