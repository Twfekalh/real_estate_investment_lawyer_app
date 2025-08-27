import 'dart:convert';

class Pagination {
	int? currentPage;
	int? lastPage;
	int? perPage;
	int? total;
	dynamic nextPageUrl;
	dynamic prevPageUrl;

	Pagination({
		this.currentPage, 
		this.lastPage, 
		this.perPage, 
		this.total, 
		this.nextPageUrl, 
		this.prevPageUrl, 
	});

	factory Pagination.fromMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull(Map<String, dynamic> data) {
		return Pagination(
			currentPage: data['current_page'] as int?,
			lastPage: data['last_page'] as int?,
			perPage: data['per_page'] as int?,
			total: data['total'] as int?,
			nextPageUrl: data['next_page_url'] as dynamic,
			prevPageUrl: data['prev_page_url'] as dynamic,
		);
	}



	Map<String, dynamic> toMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull() {
		return {
			'current_page': currentPage,
			'last_page': lastPage,
			'per_page': perPage,
			'total': total,
			'next_page_url': nextPageUrl,
			'prev_page_url': prevPageUrl,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pagination].
	factory Pagination.fromJson(String data) {
		return Pagination.fromMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Pagination] to a JSON string.
	String toJson() => json.encode(toMessageDataRequestsId2InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId4BuyerNameTax90StatusPendingCreatedAt20250827T123740000000ZUpdatedAt20250827T123740000000ZId1InvestmentCertificateId2PropertyLocationDamascusYaafourSellerId1SellerNameBuyerId3BuyerNameTax90StatusPendingCreatedAt20250827T122735000000ZUpdatedAt20250827T122735000000ZPaginationCurrentPage1LastPage1PerPage15Total2NextPageUrlNullPrevPageUrlNull());
}
