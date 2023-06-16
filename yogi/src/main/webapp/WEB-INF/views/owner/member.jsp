<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
}

.memberForm {
	width: 930px;
	height: 1100px;
	border: 1px solid #eee;
	background: white;
	margin: 0 auto;
	border-radius: 4px;
	padding: 15px 30px;
}

.input-group {
	padding: 24px 0px;
}

.check-butn {
	position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    opacity: 0;
    height: 48px;
    border-radius: 10px;
    background-color: rgb(41, 53, 61);
}

.body-main {
	width: 900px;
	border: 1px solid #eee;
	margin: 130px auto;
	border-radius: 4px;
	padding: 25px;
	background: white;
}

</style>

<div class="whole-container">
	<div class="body-main">

			<form name="memberForm" method="post">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="userId">아이디</label>
					<div class="col-sm-10 userId-box">
						<div class="row">
							<div class="col-5 pe-1">
								<input type="text" name="userId" id="userId" class="form-control" value="${dto.userId}" 
										${mode=="update" ? "readonly='readonly' ":""}
										placeholder="아이디">
							</div>
							<div class="col-3 ps-1">
								
									<button type="button" class="btn btn-light" onclick="userIdCheck();">아이디중복검사</button>
								
							</div>
						</div>
						<c:if test="${mode=='member'}">
							<small class="form-control-plaintext help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</small>
						</c:if>
					</div>
				</div>
			 
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="userPwd">패스워드</label>
					<div class="col-sm-7">
			            <input type="password" name="userPwd" id="userPwd" class="form-control" autocomplete="off" placeholder="패스워드">
			            <small class="form-control-plaintext">패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</small>
			        </div>
			    </div>
			    
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="userName">이름</label>
			        <div class="col-sm-7">
			            <input type="text" name="userName" id="userName" class="form-control" value="${dto.userName}" 
			            		${mode=="update" ? "readonly='readonly' ":""}
			            		placeholder="이름">
			        </div>
			    </div>
			 
		
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="agree">약관 동의</label>
					<div class="col-sm-8" style="padding-top: 5px;">
						<input type="checkbox" id="agree" name="agree"
							class="form-check-input"
							checked="checked"
							style="margin-left: 0;"
							onchange="form.sendButton.disabled = !checked">
						<label class="form-check-label">
							[필수] 개인정보 수집 및 이용에 동의합니다.
						</label>
					</div>
			    </div>
			     
			    <div class="row mb-3">
			        <div class="text-center">
			            <button type="button" name="sendButton" class="btn btn-danger" onclick="memberOk();"> 회원가입 <i class="bi bi-check2"></i></button>
			            
						<input type="hidden" name="userIdValid" id="userIdValid" value="false">
			        </div>
			    </div>
			
			    <div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
			    </div>
			</form>
		</div>
</div>


<script type="text/javascript">
function memberOk() {
	const f = document.memberForm;
	let str;

	str = f.userId.value;
	if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
		alert("아이디를 다시 입력 하세요. ");
		f.userId.focus();
		return;
	}

	let mode = "${mode}";
	if(mode === "member" && f.userIdValid.value === "false") {
		str = "아이디 중복 검사가 실행되지 않았습니다.";
		$("#userId").parent().find(".help-block").html(str);
		f.userId.focus();
		return;
	}
	
	str = f.userPwd.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.userPwd.focus();
		return;
	}
	
    str = f.userName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert("이름을 다시 입력하세요. ");
        f.userName.focus();
        return;
    }

   	f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();
}

function userIdCheck() {
	// 아이디 중복 검사
	let userId = $("#userId").val();

	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) { 
		var str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
		$("#userId").focus();
		$("#userId").parent().find(".help-block").html(str);
		return;
	}
	
	let url = "${pageContext.request.contextPath}/member/userIdCheck";
	let query = "userId=" + userId;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				let str = "<span style='color:blue; font-weight: bold;'>" + userId + "</span> 아이디는 사용가능 합니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#userIdValid").val("true");
			} else {
				let str = "<span style='color:red; font-weight: bold;'>" + userId + "</span> 아이디는 사용할수 없습니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#userId").val("");
				$("#userIdValid").val("false");
				$("#userId").focus();
			}
		}
	});
}
</script>