import 'package:flutter/material.dart';

class CategoryProductModel {
  int? success;
  String? message;
  List<CategoryProductData>? data;

  CategoryProductModel({this.success, this.message, this.data});

  CategoryProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryProductData>[];
      json['data'].forEach((v) {
        data!.add(CategoryProductData.fromJson(v));
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

class CategoryProductData {
  String? productId;
  String? productSerialNumber;
  String? productName;
  String? productDetails;
  String? categoryId;
  String? productImage;
  String? productType;
  String? flavor;
  String? cflavor;
  String? addOns;
  String? sdPaid;
  String? vatPaid;
  String? sdDrinks;
  String? productRate;
  String? userId;
  String? modifiedBy;
  String? status;
  String? created;
  String? modified;
  int? quantity = 1;
  TextEditingController? stockQuantityCon = TextEditingController();
  TextEditingController? discountAmountCon = TextEditingController();
  TextEditingController? percentCon = TextEditingController();
  TextEditingController? tokenNoCon = TextEditingController();
  TextEditingController?  paidAmountCon = TextEditingController();
  TextEditingController?  noteCon = TextEditingController();
  String selectProduct = "0";
  String selectWaiterData = "0";
  double? subTotalAmount;
  double? grandTotalAmount;
  String? discountAmount;
  String? vatAmount;
  double? payableAmount;
  double? changeAmount;
  double? totalAmount;
  double? currentPoint;
  String? paymentVaiName;

  CategoryProductData(
      {this.productId,
        this.productSerialNumber,
        this.productName,
        this.productDetails,
        this.categoryId,
        this.productImage,
        this.productType,
        this.flavor,
        this.cflavor,
        this.addOns,
        this.sdPaid,
        this.vatPaid,
        this.sdDrinks,
        this.productRate,
        this.userId,
        this.modifiedBy,
        this.status,
        this.created,
        this.modified,
        this.quantity,
        this.subTotalAmount,
        this.grandTotalAmount,
        this.discountAmount,
        this.vatAmount,
        this.payableAmount,
        this.changeAmount,
        this.totalAmount,
        this.currentPoint,
        this.paymentVaiName,
        this.stockQuantityCon,
        this.percentCon,
        this.tokenNoCon,
        this.paidAmountCon,
        this.noteCon,
      });

  CategoryProductData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productSerialNumber = json['product_serial_number'];
    productName = json['product_name'];
    productDetails = json['product_details'];
    categoryId = json['category_id'];
    productImage = json['product_image'];
    productType = json['product_type'];
    flavor = json['flavor'];
    cflavor = json['cflavor'];
    addOns = json['add_ons'];
    sdPaid = json['sd_paid'];
    vatPaid = json['vat_paid'];
    sdDrinks = json['sd_drinks'];
    productRate = json['product_rate'];
    userId = json['user_id'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_serial_number'] = productSerialNumber;
    data['product_name'] = productName;
    data['product_details'] = productDetails;
    data['category_id'] = categoryId;
    data['product_image'] = productImage;
    data['product_type'] = productType;
    data['flavor'] = flavor;
    data['cflavor'] = cflavor;
    data['add_ons'] = addOns;
    data['sd_paid'] = sdPaid;
    data['vat_paid'] = vatPaid;
    data['sd_drinks'] = sdDrinks;
    data['product_rate'] = productRate;
    data['user_id'] = userId;
    data['modified_by'] = modifiedBy;
    data['status'] = status;
    data['created'] = created;
    data['modified'] = modified;
    return data;
  }
}
