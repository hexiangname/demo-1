<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>

<script language="javascript">

	function checkUserInfo() {
		 if(document.regform.name.value==""){
		    alert("用户名不能为空");
		    return false;
		 }
		 if(document.regform.pwd.value==""){
		    alert("密码不能为空");
		    return false;
		 }
		 return true;
	}
	
</script>


<div style="margin-left: 165px;margin-top: 50px">
	<form method="post" name="regform" onSubmit="return checkUserInfo()" action="reg.action">
		<input type="hidden" name="op" value="reg">
		用户名:<input type="text" name="name"><br> 
		密&nbsp;码:<input type="text" name="pwd"><br>
		<input type="submit" name="submit" value="注册" style="margin-left: 80px; width: 80px">
		<br>
	</form>
	
</div>

</body>
</html>