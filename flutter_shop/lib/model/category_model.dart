class Category {
  String firstCategoryId;
  String firstCategoryName;
  dynamic comments;
  String image;
  List<SecondCategoryVO> secondCategories;

  Category(
      {this.firstCategoryId,
      this.firstCategoryName,
      this.comments,
      this.image,
      this.secondCategories});

  Category.fromJSON(Map<String, dynamic> data) {
    this.firstCategoryId = data['firstCategoryId'];
    this.firstCategoryName = data['firstCategoryName'];
    this.comments = data['comments'];
    this.image = data['image'];
    final secondCategoryVO = data['secondCategoryVO'];
    if (secondCategoryVO != null) {
      this.secondCategories = new List<SecondCategoryVO>();
      secondCategoryVO.forEach((item) =>
          this.secondCategories.add(new SecondCategoryVO.fromJSON(item)));
    }
  }

  Map<String, dynamic> toJSON() {
    final map = new Map<String, dynamic>();
    map['firstCategoryId'] = this.firstCategoryId;
    map['firstCategoryName'] = this.firstCategoryName;
    map['comments'] = this.comments;
    map['image'] = this.image;
    if (this.secondCategories != null) {
      map['secondCategoryVO'] =
          this.secondCategories.map((item) => item.toJSON());
    }
    return map;
  }
}

class SecondCategoryVO {
  String secondCategoryId;
  String firstCategoryId;
  String secondCategoryName;
  String comments;

  SecondCategoryVO(
      {this.secondCategoryId,
      this.firstCategoryId,
      this.secondCategoryName,
      this.comments});

  SecondCategoryVO.fromJSON(Map<String, dynamic> data) {
    this.secondCategoryId = data['secondCategoryId'];
    this.firstCategoryId = data['firstCategoryId'];
    this.secondCategoryName = data['secondCategoryName'];
    this.comments = data['comments'];
  }

  Map<String, dynamic> toJSON() {
    final map = new Map<String, dynamic>();
    map['secondCategoryId'] = this.secondCategoryId;
    map['firstCategoryId'] = this.firstCategoryId;
    map['secondCategoryName'] = this.secondCategoryName;
    map['comments'] = this.comments;
    return map;
  }
}
