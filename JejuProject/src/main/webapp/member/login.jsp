<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	margin-top: 200px;
	margin-bottom: 500px;
}
.loginrow{
	margin: 0px auto;
	width: 600px;
}
.table {
    border-collapse: separate;
	border-spacing: 0;
	border: 2px solid orange;
	border-radius: 10px;
	overflow: hidden;
  }
.table td,th{
	border: none;
}
</style>
</head>
<body>
<div class = "container">
	<div class = "row loginrow">
		
		<table class="table">
			<tr>
				<td colspan="3">
					<h2 style="margin-left: 30px">
					<i class="fa fa-sign-in-alt text-primary mb-4"></i>
					 Login
					</h2>
				</td>
			</tr>
			<tr>
      			<td width="30%" style="text-align: right">아이디</td>
      			<td width="40%">
      				<input type=text tabindex="1" ref="login_id" v-model="login_id" style="width: 100%">
      			</td>
      			<td rowspan="2" width="30%">
      				<input type="button" value="로그인" 
      				class="btn btn-outline-warning" 
      				style="width: 150px;height: 100px;" 
      				tabindex="3"
      				@click="login()">
      			</td>
      		</tr>
      		<tr>
      			<td width="30%" style="text-align: right">비밀번호</td>
      			<td width="40%">
      				<input type="password" tabindex="2" ref="login_pwd" v-model="login_pwd" style="width: 100%">
      			</td>
      		</tr>
      		<tr>
   				<td width="30%" style="text-align: right">아이디 저장</td>
   				<td width="70%">
   					<input type="checkbox" ref="ck" v-model="ck" style="width: 20px; height: 20px;">
   				</td>
      		</tr>
      		<tr>
      			<td colspan="3" class="text-center">
      				<a href="../member/join.do" class="btn btn-outline-success">회원가입</a>
                    <span class="btn btn-outline-danger" id="idfind">아이디 찾기</span>
                    <span class="btn btn-outline-info" id="pwdfind">비밀번호 찾기</span>
      			</td>
      		</tr>
		</table>
	</div>
</div>
<script>
	new Vue({
		el:'.container',
		data:{
			login_id:'${id}',
			login_pwd:'',
			sessionId:null,
			ck:true
		},
		methods:{
			login:function(){
				if(this.login_id==='')
				{
					alert('아이디를 입력하세요')
					this.$refs.login_id.focus()
					return;
				}
				if(this.login_pwd==='')
				{
					alert('비밀번호를 입력하세요')
					this.$refs.login_pwd.focus();
					return
				}
				axios.post('http://localhost/web/member/login_ok_vue.do',null,{
					params:{
						id:this.login_id,
						pwd:this.login_pwd,
						ck:this.ck
					}
				}).then(res=>{
					if(res.data==='NOID')
					{
						alert('아이디가 존재하지 않습니다.')
						this.login_id=''
						this.login_pwd=''
						this.$refs.login_id.focus()
					}
					else if(res.data==='NOPWD')
					{
						alert('비밀번호가 틀립니다')
						this.login_pwd=''
						this.$refs.login_pwd.focus()
					}
					else
					{
						this.sessionId=res.data
						location.href="../main/main.do"
					}
				})
			}
		}
	})
</script>
</body>
</html>