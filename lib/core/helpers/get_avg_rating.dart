  num getAvgRating(json) {
    num sum = 0;
    for (var review in json) {
      sum += review['rating'];
    }
    return sum / json.length;
  }