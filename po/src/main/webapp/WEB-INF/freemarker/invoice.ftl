<!DOCTYPE html>
<html>

<head>
<title>Invoice ${invoice.invoiceNo}</title>
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" href="assets/css/modules.css">
<link rel="stylesheet" href="assets/css/heojun.css">
<link rel="stylesheet" href="assets/css/print.css">
</head>

<body>

	<div class="page-header" style="text-align: center">
		<button type="button" onClick="window.print()"
			style="background: black">인쇄</button>
		<button type="button" onClick="history.back(-1)" style="background: black">뒤로</button>
		<button type="button" onClick="location.href='index.jsp'" style="background: black"/>메인으로</button>
	</div>

	<div class="page-footer">
	</div>

	<table>

		<thead>
			<tr>
				<td>
					<!--place holder for the fixed-position header-->
					<div class="page-header-space"></div>
				</td>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>
					<div class="page" style="line-height: 2;">
						<section>
							<div data-layout="_r">
								<div data-layout="ch10">
									<p>
									<h4>${invoice.vendorName}</h4>
									</p>
									<p>ADD : ${invoice.vendorAddress}</p>
									<p>Tel : ${invoice.vendorTel}</p>
								</div>
								<div data-layout="ch-third">
									<p>
									<h4>Commercial Invoice</h4>
									</p>
									<p>Invoice No : ${invoice.invoiceNo}</p>
									<p>Invoice Date : ${invoice.date}</p>
									<p>Customer PO# :</p>
									<p>Prepared By :</p>
								</div>
							</div>
						</section>
						<section>
							<div data-layout="_r">
								<div data-layout="ch-half">
									<p>
									<h4>Bill To :</h4>
									</p>
									<p>Buyer : healinginternational</p>
									<p>Address : 57-32 Hakhadong-ro, Yuseong-gu, Daejeon, Republic of Korea</p>
									<p>Tel : +82-42-541-1300</p>
									<p>Fax : 042-489-8759</p>
								</div>
								<div data-layout="ch-half">
									<img src="attache/${invoice.imgSrc}" style="width:300px; height:134px;" alt="">
								</div>
							</div>
						</section>

						<section>
							<div >
								<div data-layout="ch-half" style="margin:0 20px 0 20px;">
									<table class="tg">
										<thead>
											<tr>
												<th class="tg-7btt" width="5%">Item No</th>
												<th class="tg-amwm" width="50%">Description</th>
												<th class="tg-amwm" width="10%">Quantity(kg)</th>
												<th class="tg-amwm" width="10%">Unit Price(${invoice.currencyCode})</th>
												<th class="tg-amwm" width="20%">Amount(${invoice.currencyCode})</th>
											</tr>
										</thead>
										<tbody>
											<#list invoice.list as row>
												
													<tr>
														<td class="tg-baqh">${row.itemNo}</td>
														<td class="tg-baqh">${row.description}</td>
														<td class="tg-baqh">${row.quantity}</td>
														<td class="tg-baqh">${row.unitPrice}</td>
														<td class="tg-baqh">${row.amount}</td>
													</tr>	

											</#list>
											<tr>
												<td class="tg-baqh"></td>
												<td class="tg-baqh"></td>
												<td class="tg-baqh"></td>
												<td class="tg-baqh"></td>
												<td class="tg-baqh"></td>
											</tr>
											<tr>
												<td class="tg-baqh"></td>
												<td class="tg-baqh">Shipping Cost</td>
												<td class="tg-baqh"></td>
												<td class="tg-baqh"></td>
												<td class="tg-baqh">${invoice.shippingCost}</td>
											</tr>

										</tbody>
									</table>
						</section>

						<section>
							<div data-layout="_r">
								<div data-layout="ch-half">
									<p>
									<h4>Total : ${invoice.currencyCode} ${invoice.total}</h4>
									</p>
						</section>
						<section>
							<div data-layout="_r">
								<div data-layout="ch10">
									<p>BENEFICIARY NAME : ${invoice.beneficiaryName}</p>
									<p>ACCOUNT NUMBER : ${invoice.accountNo}</p>
									<p>BENEFICIARY ADDRESS : ${invoice.beneficiaryAddress}</p>
									<p>BANK NAME : ${invoice.bankName}</p>
									<p>SWIFT CODE : ${invoice.swiftCode}</p>
								</div>
								<div data-layout="ch-third">
									<p>Additional Information :</p>
									<p>${invoice.memo}</p>
								</div>
							</div>
						</section>
					</div>
				</td>
			</tr>
		</tbody>


	</table>

</body>

</html>