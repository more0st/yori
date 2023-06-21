<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
	padding-bottom: 20px;
}

.body-container{
	display: flex;
	justify-content: center;
	align-items: center;
}

.pwdtitle {
font-size: 30px;
font-weight: 900;
color: #fa0050;
}

.pwdfindform {
   margin: 150px auto 0;
   width: 700px;
   min-height: 300px;
   text-align: center;
   background: white;
   border: 1px solid #d9d9d9;
   padding : 50px;
}

.pwdbtn {
	border: none;
   width: 100%;
   height: 55px;
   color: white;
   font-size: 16px;
   background: #ccc;
   margin-top: 20px;
}

.pwdbtn:hover {
   cursor: pointer;
}
	
</style>
<main id="main" class="main">
<div class="whole-container">
	<!-- 메뉴 -->
                <div class="pwdfindform">
                    <form name="pwdForm" method="post" class="row g-3">
                        <h3 class="pwdtitle">패스워드 재확인</h3>
                        
		                <div class="d-grid">
							<p class="form-control-plaintext text-center">정보보호를 위해 패스워드를 다시 한 번 입력해주세요.</p>
		                </div>
                        
                        <div class="d-grid">
                            <input type="password" name="userPwd" class="form-control form-control-lg" placeholder="패스워드">
                        </div>
                        <div class="d-grid">
                            <button type="button" class="pwdbtn" onclick="sendOk();">확인 <i class="bi bi-check2"></i> </button>
                            <input type="hidden" name="mode" value="${mode}">
                        </div>
                    </form>

                <div class="d-grid">
					<p class="form-control-plaintext text-center">${message}</p>
                </div>
            </div>
        </div>
</main>
<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.userPwd.value.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	f.action = "${pageContext.request.contextPath}/owner/check";
	f.submit();
}
</script>