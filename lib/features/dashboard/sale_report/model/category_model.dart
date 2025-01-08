class CategoryModel {
  int? success;
  String? message;
  List<CategoryData>? data;

  CategoryModel({this.success, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
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

class CategoryData {
  String? categoryId;
  String? categoryName;
  String? categorySerial;
  String? userId;
  String? branchId;
  String? branch2;
  String? branch3;
  String? branch4;
  String? modifiedBy;
  String? status;
  String? created;
  String? modified;

  CategoryData(
      {this.categoryId,
        this.categoryName,
        this.categorySerial,
        this.userId,
        this.branchId,
        this.branch2,
        this.branch3,
        this.branch4,
        this.modifiedBy,
        this.status,
        this.created,
        this.modified});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categorySerial = json['category_serial'];
    userId = json['user_id'];
    branchId = json['branch_id'];
    branch2 = json['branch_2'];
    branch3 = json['branch_3'];
    branch4 = json['branch_4'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_serial'] = categorySerial;
    data['user_id'] = userId;
    data['branch_id'] = branchId;
    data['branch_2'] = branch2;
    data['branch_3'] = branch3;
    data['branch_4'] = branch4;
    data['modified_by'] = modifiedBy;
    data['status'] = status;
    data['created'] = created;
    data['modified'] = modified;
    return data;
  }
}
