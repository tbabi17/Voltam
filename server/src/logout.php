<?
	session_start();
	unset($_SESSION['logged']);
	session_destroy();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">
function closeIt(){
window.opener=self;
window.close();
}
</script>
</head>
<body onload="closeIt();">

</body>
</html>