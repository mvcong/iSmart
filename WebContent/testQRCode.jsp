<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script type="text/javascript" src="content/qrcode.min.js"></script>
		<script type="text/javascript">
		function onReady()
		{
			var qrcode = new QRCode("id_qrcode", {
				text:"abc",
				width:100,
				height:100,
				colorDark:"#000000",
				colorLight:"#ffffff",
				correctLevel:QRCode.CorrectLevel.H
			});
		}
		</script>
	</head>
	<body onload=onReady()>
	<h1>Hien thi QR Codes by Me</h1>
	<p>
		<div id="id_qrcode"></div>
	</p>
	</body>
</html>