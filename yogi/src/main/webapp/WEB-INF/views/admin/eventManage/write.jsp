<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tabs.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">

<style type="text/css">
.body-main {
	max-width: 900px;
}

.write-form .img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 150px;
	height: 150px;
	border-radius: 20px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}

</style>



<script type="text/javascript">

	function isValidDateFormat(data) {
		if (data.length !== 8 && data.length !== 10)
			return false;

		let p = /(\.)|(\-)|(\/)/g;
		data = data.replace(p, "");
		if (data.length !== 8)
			return false;

		let format = /^[12][0-9]{7}$/;
		if (!format.test(data))
			return false;

		let y = parseInt(data.substr(0, 4));
		let m = parseInt(data.substr(4, 2));
		let d = parseInt(data.substr(6));

		if (m<1 || m>12)
			return false;
		let lastDay = (new Date(y, m, 0)).getDate();
		if (d<1 || d>lastDay)
			return false;

		return true;
	}

	function check() {
		const f = document.eventForm;
		let mode = "${mode}";

		let str = f.subject.value;
		if (!str) {
			alert("제목을 입력하세요. ");
			f.subject.focus();
			return;
		}

		if (!isValidDateFormat(f.start_day.value)) {
			alert("날짜를 입력하세요.");
			f.start_day.focus();
			return;
		}

		if (!isValidDateFormat(f.end_day.value)) {
			alert("날짜를 입력하세요.");
			f.end_day.focus();
			return;
		}

		let sd = new Date(f.start_day.value + " " + f.start_time.value);
		let ed = new Date(f.end_day.value + " " + f.end_time.value);
		let cd = new Date(f.expired_date.value);

		if (sd.getTime() >= ed.getTime()) {
			alert("시작날짜는 종료날짜보다 크거나 같을 수 없습니다.");
			f.start_day.focus();
			return;
		}
		
		if(ed.getTime() > cd.getTime()){
			alert("쿠폰 유효기간은 이벤트 종료기간보다 늦어야합니다.")
			f.expired_date.focus();
			return;
		}


		str = f.content.value;
		if (!str || str === "<p><br></p>") {
			alert("내용을 입력하세요. ");
			f.content.focus();
			return;
		}
		
	    if( (mode === "write") && (!f.selectFile.value) ) {
	        alert("이미지 파일을 추가 하세요. ");
	        f.selectFile.focus();
	        return;
		}
	
		f.action = "${pageContext.request.contextPath}/admin/eventManage/${category}/${mode}";
		f.submit();
	}
	
	$(function() {
		let img = "${dto.imgFileName}";
		if( img ) { // 수정인 경우
			img = "${pageContext.request.contextPath}/uploads/admin/event/" + img;
			$(".write-form .img-viewer").empty();
			$(".write-form .img-viewer").css("background-image", "url("+img+")");
		}
		
		$(".write-form .img-viewer").click(function(){
			$("form[name=eventForm] input[name=selectFile]").trigger("click"); 
		});
		
		$("form[name=eventForm] input[name=selectFile]").change(function(){
			let file = this.files[0];
			if(! file) {
				$(".write-form .img-viewer").empty();
				if( img ) {
					img = "${pageContext.request.contextPath}/uploads/admin/event/" + img;
				} else {
					img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
				}
				$(".write-form .img-viewer").css("background-image", "url("+img+")");
				
				return false;
			}
			
			if(! file.type.match("image.*")) {
				this.focus();
				return false;
			}
			
			let reader = new FileReader();
			reader.onload = function(e) {
				$(".write-form .img-viewer").empty();
				$(".write-form .img-viewer").css("background-image", "url("+e.target.result+")");
			}
			reader.readAsDataURL(file);
		});
	});
</script>

<main id="main" class="main">

	<section class="section">
		<div class="card">
			<div class="card-body">
				
				
				<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist" style="margin-top: 15px; margin-bottom: 40px;">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="tab-all" data-bs-toggle="tab"
							data-category="all" type="button" role="tab"
							>전체 이벤트</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-upcoming" data-bs-toggle="tab"
							data-category="upcoming" type="button" role="tab"
							>진행예정인 이벤트</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-progress" data-bs-toggle="tab"
							data-category="progress" type="button" role="tab"
							>진행중인 이벤트</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-ended" data-bs-toggle="tab"
							data-category="ended" type="button" role="tab"
							>종료된 이벤트</button>
					</li>
				</ul>
				

				<form name="eventForm" method="post" enctype="multipart/form-data" class="text-center">
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="subject" value="${dto.subject}">
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">시작일자</label>
						<div class="col-sm-3">
							<input type="date" name="start_day" class="form-control" value="${dto.start_day}"> 
						</div>
						<div class="col-sm-3">
							<input type="time" name="start_time" class="form-control" value="${dto.start_time}">
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">종료일자</label>
						<div class="col-sm-3">
							<input type="date" name="end_day" class="form-control"value="${dto.end_day}"> 
						</div>
						<div class="col-sm-3">
							<input type="time" name="end_time" class="form-control" value="${dto.end_time}">
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">쿠폰 유효기간</label>
						<div class="col-sm-3">
							<input type="date" name="expired_date" class="form-control"value="${dto.expired_date}"> 
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">쿠폰사용 최저금액</label>
						<div class="col-sm-3">
							<input type="text" name="min_price" class="form-control" value="${dto.min_price}"> 
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">쿠폰 할인금액</label>
						<div class="col-sm-3">
							<input type="text" name="discount" class="form-control" value="${dto.discount}"> 
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">출력여부</label>
						<div class="col-sm-1 col-form-label">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="enabled" name="enabled" 
										value="1" ${mode=="write" || dto.enabled==1 ? "checked='checked' ":"" }>
								<label class="form-check-label" for="enabled">표시</label>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">내용</label>
						<div class="col-6">
							<textarea class="form-control" name="content" placeholder="내용" 
									id="content" style="height: 300px;" >${dto.content}</textarea>	
						</div>
					</div>
					<div class="write-form">
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">이미지</label>
							<div class="col-6">
								<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">	
								<div class="img-viewer"></div>
							</div>
						</div>
					</div>
					
					
					
					<div class="text-center">
						<button type="button" class="btn btn-success" onclick="check();">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn btn-secondary">다시입력</button>
						<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.eventNum}">
								<input type="hidden" name="imgFileName" value="${dto.imgFileName}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
					</div>
				</form>


			</div>
		</div>
	</section>
</main>