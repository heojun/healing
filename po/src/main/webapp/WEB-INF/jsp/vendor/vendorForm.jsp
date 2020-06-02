<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>vendor</title>
<script>
function fn_formSubmit(){
	var form1 = document.form1;
	
	if (form1.name.value=="") {
		alert("업체명을 입력해주세요.");
		form1.name.focus();
		return;
	}
	
	document.form1.submit();	
} 
</script>
</head>
<body>
	<form name="form1" action="vendorSave" method="post">
		<table border="1" style="width:600px">
			<caption>업체생성</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>업체명</td> 
					<td><input type="text" name="name" size="70" maxlength="250" value="<c:out value="${vendorInfo.name}"/>"></td> 
				</tr>
				<tr>
					<td>주소</td> 
					<td><input type="text" name="address" size="70" maxlength="250" value="<c:out value="${vendorInfo.address}"/>"></td> 
				</tr>
				<tr>
					<td>전화번호</td> 
					<td><input type="text" name="tel" size="70" maxlength="250" value="<c:out value="${vendorInfo.tel}"/>"></td> 
				</tr>
				<tr>
					<td>수익자명</td> 
					<td><input type="text" name="bName" size="70" maxlength="250" value="<c:out value="${vendorInfo.bName}"/>"></td> 
				</tr>
				<tr>
					<td>계좌번호</td> 
					<td><input type="text" name="accountNo" size="70" maxlength="250" value="<c:out value="${vendorInfo.accountNo}"/>"></td> 
				</tr>
				<tr>
					<td>수익자주소</td> 
					<td><input type="text" name="bAddress" size="70" maxlength="250" value="<c:out value="${vendorInfo.bAddress}"/>"></td> 
				</tr>
				<tr>
					<td>은행명</td> 
					<td><input type="text" name="bank" size="70" maxlength="250" value="<c:out value="${vendorInfo.bank}"/>"></td> 
				</tr>
				<tr>
					<td>은행코드</td> 
					<td><input type="text" name="swiftCode" size="70" maxlength="250" value="<c:out value="${vendorInfo.swiftCode}"/>"></td> 
				</tr>
				<tr>
					<td>생성일시</td> 
					<td><input type="text" name="createDateTime" size="70" maxlength="250" value="<c:out value="${vendorInfo.createDateTime}"/>"></td> 
				</tr>
				<tr>
					<td>수정일시</td> 
					<td><input type="text" name="updateDateTime" size="70" maxlength="250" value="<c:out value="${vendorInfo.updateDateTime}"/>"></td> 
				</tr>
			</tbody>
		</table>    
		<input type="hidden" name="id" value="<c:out value="${vendorInfo.id}"/>"> 
		<a href="#" onclick="fn_formSubmit()">저장</a>
	</form>	
</body>
</html>
