class Restaurant {
  String locationId;
  String name;
  String latitude;
  String longitude;
  String numReviews;
  String timezone;
  String locationString;
  String photo;
  List<Awards> awards;
  String geoDescription;
  bool hasRestaurantCoverpage;
  bool hasAttractionCoverpage;
  bool hasCuratedShoppingList;

  Restaurant(
      {this.locationId,
      this.name,
      this.latitude,
      this.longitude,
      this.numReviews,
      this.timezone,
      this.locationString,
      this.photo,
      this.awards,
      this.geoDescription,
      this.hasRestaurantCoverpage,
      this.hasAttractionCoverpage,
      this.hasCuratedShoppingList});

  Restaurant.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    numReviews = json['num_reviews'];
    timezone = json['timezone'];
    locationString = json['location_string'];
    photo = json['photo']['images']['medium']['url'] != null
        ? json['photo']['images']['medium']['url']
        : null;
    if (json['awards'] != null) {
      awards = new List<Awards>();
      json['awards'].forEach((v) {
        awards.add(new Awards.fromJson(v));
      });
    }
    geoDescription = json['geo_description'];
    hasRestaurantCoverpage = json['has_restaurant_coverpage'];
    hasAttractionCoverpage = json['has_attraction_coverpage'];
    hasCuratedShoppingList = json['has_curated_shopping_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['num_reviews'] = this.numReviews;
    data['timezone'] = this.timezone;
    data['location_string'] = this.locationString;
    if (this.photo != null) {
      data['photo'] = this.photo;
    }
    if (this.awards != null) {
      data['awards'] = this.awards.map((v) => v.toJson()).toList();
    }
    data['geo_description'] = this.geoDescription;
    data['has_restaurant_coverpage'] = this.hasRestaurantCoverpage;
    data['has_attraction_coverpage'] = this.hasAttractionCoverpage;
    data['has_curated_shopping_list'] = this.hasCuratedShoppingList;
    return data;
  }
}

class Photo {
  Sizes sizes;

  Photo({this.sizes});

  Photo.fromJson(Map<String, dynamic> json) {
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    return data;
  }
}

class Sizes {
  Small small;
  Small thumbnail;
  Small original;
  Small large;
  Small medium;

  Sizes({this.small, this.thumbnail, this.original, this.large, this.medium});

  Sizes.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? new Small.fromJson(json['small']) : null;
    thumbnail = json['thumbnail'] != null
        ? new Small.fromJson(json['thumbnail'])
        : null;
    original =
        json['original'] != null ? new Small.fromJson(json['original']) : null;
    large = json['large'] != null ? new Small.fromJson(json['large']) : null;
    medium = json['medium'] != null ? new Small.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.small != null) {
      data['small'] = this.small.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.original != null) {
      data['original'] = this.original.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    return data;
  }
}

class Small {
  String width;
  String url;
  String height;

  Small({this.width, this.url, this.height});

  Small.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    url = json['url'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['url'] = this.url;
    data['height'] = this.height;
    return data;
  }
}

class Awards {
  String awardType;
  String year;
  AwardPhoto awardPhoto;
  List<String> categories;
  String displayName;

  Awards(
      {this.awardType,
      this.year,
      this.awardPhoto,
      this.categories,
      this.displayName});

  Awards.fromJson(Map<String, dynamic> json) {
    awardType = json['award_type'];
    year = json['year'];
    awardPhoto = json['awardPhoto'] != null
        ? new AwardPhoto.fromJson(json['awardPhoto'])
        : null;
    categories = json['categories'].cast<String>();
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['award_type'] = this.awardType;
    data['year'] = this.year;
    if (this.awardPhoto != null) {
      data['awardPhoto'] = this.awardPhoto.toJson();
    }
    data['categories'] = this.categories;
    data['display_name'] = this.displayName;
    return data;
  }
}

class AwardPhoto {
  String small;
  String large;

  AwardPhoto({this.small, this.large});

  AwardPhoto.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    return data;
  }
}
