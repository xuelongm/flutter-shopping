class CategoryGoodsModel {
  String name;
  String image;
  double presentPrice;
  String goodsId;
  double oriPrice;

  CategoryGoodsModel(this.name, this.image, this.presentPrice, this.goodsId, this.oriPrice);

  CategoryGoodsModel.fromJson(Map data) {
    this.name = data['name'];
    this.image = data['image'];
    this.presentPrice = data['presentPrice'];
    this.goodsId = data['goodsId'];
    this.oriPrice = data['oriPrice'];
  }
}