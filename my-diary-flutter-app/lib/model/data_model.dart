class DataModel {
  String? date;
  String? route;
  String? pro;
  int? dcQty;
  int? dcPay;
  int? stopsQty;
  int? stopsPay;
  int? milesQty;
  int? milesPay;
  int? bckQty;
  double? bckPay;
  double? preTrip;
  double? postTrip;
  int? loPre;
  int? loPost;
  int? total;

  DataModel(
      {this.date,
      this.route,
      this.pro,
      this.dcQty,
      this.dcPay,
      this.stopsQty,
      this.stopsPay,
      this.milesQty,
      this.milesPay,
      this.bckQty,
      this.bckPay,
      this.preTrip,
      this.postTrip,
      this.loPre,
      this.loPost,
      this.total});

  DataModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    route = json['route'];
    pro = json['pro'];
    dcQty = json['dc_qty'];
    dcPay = json['dc_pay'];
    stopsQty = json['stops_qty'];
    stopsPay = json['stops_pay'];
    milesQty = json['miles_qty'];
    milesPay = json['miles_pay'];
    bckQty = json['bck_qty'];
    bckPay = json['bck_pay'];
    preTrip = json['pre_trip'];
    postTrip = json['post_trip'];
    loPre = json['loPre'];
    loPost = json['loPost'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['route'] = this.route;
    data['pro'] = this.pro;
    data['dc_qty'] = this.dcQty;
    data['dc_pay'] = this.dcPay;
    data['stops_qty'] = this.stopsQty;
    data['stops_pay'] = this.stopsPay;
    data['miles_qty'] = this.milesQty;
    data['miles_pay'] = this.milesPay;
    data['bck_qty'] = this.bckQty;
    data['bck_pay'] = this.bckPay;
    data['pre_trip'] = this.preTrip;
    data['post_trip'] = this.postTrip;
    data['loPre'] = this.loPre;
    data['loPost'] = this.loPost;
    data['total'] = this.total;
    return data;
  }
}

String jsonData = """{
	"results": [{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 254
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 56
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 65
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 52
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 120
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 526
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 253
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 54
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 52
		},
		{
			"date": "11/29/2022",
			"route": "TBE3",
			"pro": "110526",
			"dc_qty": 5,
			"dc_pay": 52,
			"stops_qty": 0,
			"stops_pay": 25,
			"miles_qty": 5,
			"miles_pay": 20,
			"bck_qty": 3,
			"bck_pay": 25.49,
			"pre_trip": 16.45,
			"post_trip": 15.49,
			"loPre": 0,
			"loPost": 0,
			"total": 56
		}

	]

}""";
