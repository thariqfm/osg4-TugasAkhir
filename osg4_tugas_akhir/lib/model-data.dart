class Root {
  String data_id;
  String data_name;
  String data_type;
  String data_desc;
  String data_race;
  String data_archetype;
  List<CardSets> cardSets;
  List<CardImages> cardImages;
  CardPrices cardPrices;

  Root(
      {this.data_id,
      this.data_name,
      this.data_type,
      this.data_desc,
      this.data_race,
      this.data_archetype,
      this.cardSets,
      this.cardImages,
      this.cardPrices});

  Root.fromJson(Map<String, dynamic> json) {
    data_id         = json['id'];
    data_name       = json['name'];
    data_type       = json['type'];
    data_desc       = json['desc'];
    data_race       = json['race'];
    data_archetype  = json['archetype'];
    if (json['card_sets'] != null) {
      cardSets = new List<CardSets>();
      json['card_sets'].forEach((v) {
        cardSets.add(new CardSets.fromJson(v));
      });
    }
    if (json['card_images'] != null) {
      cardImages = new List<CardImages>();
      json['card_images'].forEach((v) {
        cardImages.add(new CardImages.fromJson(v));
      });
    }
    cardPrices = json['card_prices'] != null
        ? new CardPrices.fromJson(json['card_prices'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.data_id;
    data['name'] = this.data_name;
    data['type'] = this.data_type;
    data['desc'] = this.data_desc;
    data['race'] = this.data_race;
    data['archetype'] = this.data_archetype;
    if (this.cardSets != null) {
      data['card_sets'] = this.cardSets.map((v) => v.toJson()).toList();
    }
    if (this.cardImages != null) {
      data['card_images'] = this.cardImages.map((v) => v.toJson()).toList();
    }
    if (this.cardPrices != null) {
      data['card_prices'] = this.cardPrices.toJson();
    }
    return data;
  }
}

class CardSets {
  String setDataRarity;
  String setDataCode;
  String setDataPrice;
  String setDataName;

  // CardSets({this.setName, this.setCode, this.setRarity, this.setPrice});
  CardSets({this.setDataRarity, this.setDataCode, this.setDataPrice, this.setDataName,});

  CardSets.fromJson(Map<String, dynamic> json) {
    setDataRarity   = json['set_rarity'];
    setDataCode     = json['set_code'];
    setDataPrice    = json['set_price'];
    setDataName     = json['set_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_rarity'] = this.setDataRarity;
    data['set_code'] = this.setDataCode;
    data['set_price'] = this.setDataPrice;
    data['set_name'] = this.setDataName;
    return data;
  }
}

class CardImages {
  String imgID;
  String imgUrl;
  String imgUrlSmall;

  CardImages({this.imgID, this.imgUrl, this.imgUrlSmall});

  CardImages.fromJson(Map<String, dynamic> json) {
    imgID       = json['id'];
    imgUrl      = json['image_url'];
    imgUrlSmall = json['image_url_small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']              = this.imgID;
    data['image_url']       = this.imgUrl;
    data['image_url_small'] = this.imgUrlSmall;
    return data;
  }
}

class CardPrices {
  String cardmarketPrice;
  String tcgplayerPrice;
  String ebayPrice;
  String amazonPrice;

  CardPrices(
      {this.cardmarketPrice,
      this.tcgplayerPrice,
      this.ebayPrice,
      this.amazonPrice});

  CardPrices.fromJson(Map<String, dynamic> json) {
    cardmarketPrice   = json['cardmarket_price'];
    tcgplayerPrice    = json['tcgplayer_price'];
    ebayPrice         = json['ebay_price'];
    amazonPrice       = json['amazon_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardmarket_price'] = this.cardmarketPrice;
    data['tcgplayer_price'] = this.tcgplayerPrice;
    data['ebay_price'] = this.ebayPrice;
    data['amazon_price'] = this.amazonPrice;
    return data;
  }
}