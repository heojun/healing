<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<style type="text/css">
		button {
		    width:300px;
		    background-color: #606060;
		    border: none;
		    color:#fff;
		    padding: 10px 0;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 30px;
		    margin: 10px;
		    cursor: pointer;
		    border-radius:10px;
		}
	</style>
</head>
<body>
	<h1>주문서</h1>
	<button type="button" onClick="location.href='http://localhost:8080/po/vendorList'">업체관리</button>
	<br /><br />
	<button type="button" onClick="location.href='http://localhost:8080/po/itemList'"/>품목관리</button>
	<br /><br />
	<button type="button" onClick="location.href='http://localhost:8080/po/invoiceList'"/>주문서생성</button>
</body>
</html>
