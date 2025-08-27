import 'dart:convert';

class Request {
	int? id;
	int? investmentCertificateId;
	String? propertyLocation;
	int? sellerId;
	String? sellerName;
	int? buyerId;
	String? buyerName;
	int? tax;
	String? status;
	DateTime? createdAt;
	DateTime? updatedAt;

	Request({
		this.id, 
		this.investmentCertificateId, 
		this.propertyLocation, 
		this.sellerId, 
		this.sellerName, 
		this.buyerId, 
		this.buyerName, 
		this.tax, 
		this.status, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Request.fromMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull(Map<String, dynamic> data) {
		return Request(
			id: data['id'] as int?,
			investmentCertificateId: data['investment_certificate_id'] as int?,
			propertyLocation: data['property_location'] as String?,
			sellerId: data['seller_id'] as int?,
			sellerName: data['seller_name'] as String?,
			buyerId: data['buyer_id'] as int?,
			buyerName: data['buyer_name'] as String?,
			tax: data['Tax'] as int?,
			status: data['status'] as String?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull() {
		return {
			'id': id,
			'investment_certificate_id': investmentCertificateId,
			'property_location': propertyLocation,
			'seller_id': sellerId,
			'seller_name': sellerName,
			'buyer_id': buyerId,
			'buyer_name': buyerName,
			'Tax': tax,
			'status': status,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Request].
	factory Request.fromJson(String data) {
		return Request.fromMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Request] to a JSON string.
	String toJson() => json.encode(toMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull());
}
