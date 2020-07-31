<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="assets/css/table.css">
	<link rel="stylesheet" href="assets/css/button.css">
<title>업체관리</title>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		if(document.getElementById("selectedVendor").value != null){
			document.getElementById("vendor").value = document.getElementById("hiddenKeyword").value;
		}
	}, false);
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	            results = regex.exec(location.search);
	    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	
	function fn_formSubmit() {
		if (document.form1.name.value == "") {
			alert("품목명을 입력해주세요.");
			document.form1.name.focus();
			return;
		}
		document.form1.submit();
	}
	function fn_searchFormSubmit() {
		
		document.searchForm.submit();
	}
	function fn_deleteItemFormSubmit() {
		document.deleteItemForm.submit();
	}

	function selectBox1Changed() {
		var selectedValue = document.getElementById("selectBox1").value;
		document.getElementById("vendor").value = selectedValue;
		document.getElementById("selectedVendor").value = selectedValue;
		document.getElementById("hiddenKeyword").value = selectedValue;
		fn_searchFormSubmit();
	}
	function selectBox2Changed() {
		var selectedValue = document.getElementById("selectBox2").value;
		document.getElementById("vendor").value = selectedValue;
		document.getElementById("selectedVendor").value = selectedValue;
		document.getElementById("hiddenKeyword").value = selectedValue;
		fn_searchFormSubmit();
	}
	function fn_createItemFormSubmit() {
		document.createItemForm.submit();
	}
</script>
</head>
<body>
	<form name="form1" action="itemSave" method="post">
		<table>
			<caption>품목생성</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>

				<tr>
					<td>업체명</td>
					<td><select id="selectBox1" onchange="selectBox1Changed();"
						name="selectBoxTag1" style="width:100%; border: 1;">
							<c:forEach var="i" items="${vendorList}">
								<option value="${i.id}"
									${i.id == searchVO.selectedVendor ? 'selected="selected"' : '' }>${i.name}</options>
							</c:forEach>
					</select></td>
					<input type="hidden" name="vendorName" id ="vendorName" value="<c:out value="${itemInfo.vendorName}"/>">
				</tr>
				<tr>
					<td>품목명</td>
					<td><input type="text" name="name" size="70" maxlength="250"
						value="<c:out value="${itemInfo.name}"/>"></td>
				</tr>
				<tr>
					<td>단가</td>
					<td><input type="text" name="unitPrice" size="70"
						maxlength="250" value="<c:out value="${itemInfo.unitPrice}"/>"></td>
				</tr>

			</tbody>
		</table>
		<input type="hidden" id="selectedVendor" name="selectedVendor"
				value="${searchVO.selectedVendor}" />
		<input type="hidden" name="id" value="<c:out value="${itemInfo.id}"/>">
		<input type="hidden" id="vendor" name="vendor" value="${itemInfo.vendor}" />
		<button type="button" class="navyBtn" onClick="fn_formSubmit()">저장</button>
	</form>
	<br>
	<form id="searchForm" name="searchForm" method="post">
		<label class="chkselect" for="searchType1">업체명</label> 
		<select
			id="selectBox2" onchange="selectBox2Changed();" name="selectBoxTag2">
			<c:forEach var="i" items="${vendorList}">
				<option value="${i.id}"
					${i.id == searchVO.hiddenKeyword ? 'selected="selected"' : '' }>${i.name}</options>
			</c:forEach>
		</select>

		<div>
			<input type="hidden" id="hiddenKeyword" name="hiddenKeyword"
				value="${searchVO.hiddenKeyword}" /> 
			<input type="hidden"
				name="searchType" value="name" checked="checked" /> 
			<label
				class="chkselect" for="searchType1">품목명</label> 
			<input type="text"
				name="searchKeyword" style="width: 150px;" maxlength="50"
				value='<c:out value="${searchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) { fn_searchFormSubmit();}">
			<input name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_searchFormSubmit()" />
		</div>
	</form>
	<br>

	<form id="deleteItemForm" name="deleteItemForm" action="deleteItems"
		method="post">
		<table class="TABLE" style="text-align:center">
			<thead>
				<tr>
					<th width="5%"></th>
					<th width="10%">번호</th>
					<th width="20%">업체명</th>
					<th width="40%">품목명</th>
					<th width="20%">단가</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="listview" items="${listview}" varStatus="status">
					<c:url var="link" value="itemRead">
						<c:param name="id" value="${listview.id}" />
					</c:url>

					<tr>
						<td width="5%"><input type="checkbox" name="delete_item_ids"
							value="${listview.id}" /></td>
						<td width="10%"><c:out
								value="${status.index+1}" />
						</td>
						<td width="20%"><c:out value="${listview.vendorName}" /></td>
						<td width="40%"><a href="${link}"><c:out
									value="${listview.getShortTitle(35)}" /></a></td>
						<td width="20%"><c:out value="${listview.unitPrice}" /></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<input name="btn_delete" value="삭제" class="btn_del" type="button"
			onclick="fn_deleteItemFormSubmit()" />
	</form>
	<button type="button" onClick="history.back(-1)">뒤로</button>
	<button type="button" onClick="location.href='index.jsp'"/>메인으로</button>
</body>

</html>
