<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>품목생성</title>
<script>
	function fn_formSubmit() {
		var form1 = document.form1;

		if (form1.name.value == "") {
			alert("품목명을 입력해주세요.");
			form1.name.focus();
			return;
		}

		document.form1.submit();
	}
</script>
</head>
<body>
	<form name="form1" action="itemSave" method="post">
		<table border="1" style="width: 600px">
			<caption>품목생성</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				
				<tr>
					<td>업체명</td>
					<td><input type="text" name="vendorName" size="70"
						maxlength="250" value="<c:out value="${itemInfo.vendorName}"/>"></td>
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
				<tr>
					<td>생성일시</td>
					<td><input type="text" name="createDateTime" size="70"
						maxlength="250"
						value="<c:out value="${itemInfo.createDateTime}"/>"></td>
				</tr>
				<tr>
					<td>수정일시</td>
					<td><input type="text" name="updateDateTime" size="70"
						maxlength="250"
						value="<c:out value="${itemInfo.updateDateTime}"/>"></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="id" value="<c:out value="${itemInfo.id}"/>">
		<input type="hidden" name="vendor" value="${itemInfo.vendor}"/>
		<a href="#" onclick="fn_formSubmit()">저장</a>
	</form>
</body>
</html>
