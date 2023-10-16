<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-header container-fluid bg-primary d-flex flex-column align-items-center justify-content-center">
    <h1 class="display-3 text-uppercase mb-3">회원가입</h1>
    <div class="d-inline-flex text-white">
        <h6 class="text-uppercase m-0"><a class="text-white" href="">회원</a></h6>
        <h6 class="m-0 px-3">/</h6>
        <h6 class="text-uppercase m-0">회원가입</h6>
    </div>
</div>
<div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <div class="row">
                <div class="col-12">
                	<table class="table">
				        <tr>
				         <th class="text-right" width=10%>ID</th>
				         <td width=90% class="inline">
				          <input type=text name=id ref=id size=20 class="input-sm"
				           v-model="id" @blur="idCheck" v-bind:readonly="isDisabled">
				          <!-- <input type=button value="중복체크" class="btn btn-sm btn-success" ref="id" v-model="id" @blur="idCheck"> -->
				          <p>{{idOk}}</p>
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>비밀번호</th>
				         <td width=90% class="inline">
				          <input type=password name=pwd ref="pwd" size=20 class="input-sm" v-model="pwd" @keyup="pwdValidate">
				          &nbsp;재입력:<input type=password name=pwd1 ref="pwd1" v-model="pwd1" size=20 class="input-sm" @keyup="pwd2Validate">
				          <p>{{pwdOk}}</p>
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>이름</th>
				         <td width=90% class="inline">
				          <input type=text name=name ref="name" size=20 class="input-sm" v-model="name">
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>성별</th>
				         <td width=90% class="inline">
				          <input type="radio" name=sex value="남자" checked
				          ref="sex" v-model="sex">남자
				          <input type="radio" name=sex value="여자" 
				          ref="sex" v-model="sex">여자
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>생년월일</th>
				         <td width=90% class="inline">
				          <input type="date" name=birth size=20  ref="birth" v-model="birth">
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>이메일</th>
				         <td width=90% class="inline">
				          <input type=text name=email ref=email size=55 class="input-sm" v-model="email" @keyup="emailCheck">
				          <input type=button value="이메일체크" 
				            class="btn btn-sm btn-danger" id="emailBtn">
				            <p>{{emailOk}}</p>
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>우편번호</th>
				         <td width=90% class="inline">
				          <input type=text name="post" ref="post" v-model="post" size=10 class="input-sm">
				          <input type=button value="우편번호검색" class="btn btn-sm btn-info"
				            v-on:click="postFind()">
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>주소</th>
				         <td width=90% class="inline">
				          <input type=text name="addr1" ref="addr1" v-model="addr1" size=55 class="input-sm"
				           readonly
				          >
				         </td>
				        </tr>
				        
				        <tr>
				         <th class="text-right" width=10%>상세주소</th>
				         <td width=90% class="inline">
				          <input type=text name=addr2 id=addr2 size=55 class="input-sm">
				         </td>
				        </tr>
				       
				        <tr>
				         <th class="text-right" width=10%>전화</th>
				         <td width=90% class="inline">
				          <select name=phone1 class="input-sm"  ref="phone1" v-model="phone1">
				           <option>010</option>
				          </select>
				          <input type=text name=phone ref=phone size=12 class="input-sm" v-model="phone">
				          <input type=button value="전화체크" 
				            class="btn btn-sm btn-warning" id="phoneBtn">
				         </td>
				        </tr> 
				       
				        <tr>
				         <th class="text-right" width=10%>소개</th>
				         <td width=90% class="inline">
				          <textarea rows="10" cols="55" name=content ref="content" v-model="content"></textarea>
				         </td>
				        </tr> 
				        
				        <tr>
				          <td colspan="2" class="text-center">
				           <input type="submit" value="회원가입" 
				             class="btn btn-success btn-sm" id="joinBtn">
				           <input type=button value="취소"
				             class="btn btn-info btn-sm" onclick="javascript:history.back()">
				          </td>
				        </tr>
				      </table>
                </div>
            </div>
        </div>
</div> 
<script>
	new Vue({
		el:'.container',
		data:{
			id:'',
			pwd:'',
			pwd1:'',
  			name:'',
  			sex:'',
  			birth:'',
  			email:'',
  			post:'',
  			addr1:'',
  			addr2:'',
  			phone1:'010',
  			phone:'',
  			content:'',
  			idOk:'',
  			pwdOk:'',
  			emailOk:'',
  			phoneOk:'',
  			isDisabled:false
		},
		methods:{
			submintForm:function(event){
				if(this.id && this.name && this.pwd && this.pwd1
						&& this.sex && this.email && this.birth 
						&& this.post && this.addr1 && this.phone && this.phone1 
						&& !this.idOk && !this.emailOk){
					return true;
				}	
				
				if(this.id=='' || this.idOk!='')
				{
					this.$refs.id.focus();
				}
				else if(this.pwd=='')
				{
					this.$refs.pwd.focus();
				}
				else if(this.pwd1=='')
				{
					this.$refs.pwd1.focus();
				}
				else if(this.pwd != this.pwd1)
				{
					this.pwd='';
					this.pwd1='';
				}
				else if(this.name=='')
				{
					this.$refs.name.focus();
				}
				else if(this.email=='' || this.emailOk!='')
				{
					this.$refs.email.focus();
				}
				else if(this.post==''){
					alert('우편번호를 입력하세요')
				}
				else if(this.phone==''){
					this.$refs.phone.focus()
				}
				event.preventDefault()
			},
			postFind:function(){
				let_this=this
				new daum.Postcode({
					oncomplete:function(data){
	  					_this.post=data.zonecode;
	  					_this.addr1=data.address;  						
  					}
				}).open()
			},
			idCheck:function(){
  				if(this.id!=='')
  				{
  					axios.get("http://localhost/web/member/idcheck_ok_vue.do",{
  						params:{
  							id:this.id
  						}
  					}).then(res=>{
  						if(res.data=='no')
  						{
  							this.idOk('이미 존재하는 아이디입니다.')
  						}
  						else
  						{
  							this.idCheckValidate(res.data)
  						}
  					})
  				}
  				else
  				{
  					this.idOk=''
  				}
  			},
		}
	})
</script>               
</body>
</html>