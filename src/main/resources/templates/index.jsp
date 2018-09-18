<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body leftmargin="0" onload="changeImg()">
	<script language="javascript">
		function changeVildateCode(obj) {
			var timenow = new Date().getTime();
			obj.src = "image.jsp?d=" + timenow;//为了让服务器认为客户端的每次请求验证码都是全新，所以加入了时间
		}

		function checkUserInfo() {
			if (document.regform.name.value == "") {
				alert("用户名不能为空");
				return false;
			}
			if (document.regform.pwd.value == "") {
				alert("密码不能为空");
				return false;
			}
			if (document.regform.code.value == "") {
				alert("验证码不能为空");
				return false;
			}
			return true;
		}
	</script>

	<form action="loginstu.action" method="post" onsubmit="return check()">

		用户名:<input type="text" name="name" /> 密码:<input type="password"
			name="pwd"> <input type="submit" value="登录" />
			<input class="text" type="code" name="code" id="vcode">
			<span id="code" title="看不清，换一张"></span>
		<!-- <table>
			<tr>
				<td>&nbsp;</td>
				<td valign="middle" align="center">验证码:</td>
				<td valign="top"><input type="text" name="valcode" size="10"
					class="input"> <img src="image.jsp"
					onclick="changeVildateCode(this)" title="点击图片刷新验证码" size="10" />
				
					</td>
				<td>&nbsp;</td>
			</tr>
		</table> -->
	</form>

	<a href="toreg.action">注册</a>

</body>
<script type="text/javascript">
    var code;//声明一个变量用于存储生成的验证码
    document.getElementById("code").onclick=changeImg;
    function changeImg(){
        //alert("换图片");
        var arrays=new Array(
            '1','2','3','4','5','6','7','8','9','0',
            'a','b','c','d','e','f','g','h','i','j',
            'k','l','m','n','o','p','q','r','s','t',
            'u','v','w','x','y','z',
            'A','B','C','D','E','F','G','H','I','J',
            'K','L','M','N','O','P','Q','R','S','T',
            'U','V','W','X','Y','Z'
        );
        code='';//重新初始化验证码
        //alert(arrays.length);
        //随机从数组中获取四个元素组成验证码
        for(var i=0;i<4;i++){
            //随机获取一个数组的下标
            var r=parseInt(Math.random()*arrays.length);
            code+=arrays[r];
            //alert(arrays[r]);
        }
        //alert(code);
        document.getElementById('code').innerHTML=code;//将验证码写入指定区域
    }

    //效验验证码(表单被提交时触发)
    function check(){
        //获取用户输入的验证码
        var input_code=document.getElementById('vcode').value;
        //alert(input_code+"----"+code);
        if(input_code.toLowerCase()==code.toLowerCase())
        {
            //验证码正确(表单提交)
            return true;
        }
        alert("请输入正确的验证码!");
        //验证码不正确,表单不允许提交
        return false;
    }
</script>
</html>