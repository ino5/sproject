<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/header/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/header/headerHead.jsp"%>
<link rel="styleSheet"
	href="${pageContext.request.contextPath}/board/css/board.css">
<script src="${pageContext.request.contextPath}/board/js/board.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
function communityGroup() {
    var delchk = []; // key 값을 담을 배열
     var bd_num = modal_form.bd_num.value;
    //삭제 key value
    // chk라는 클래스를 가진 체크박스 중에 체크가 된
    // object들을 찾아서 delchk라는 배열에 담는다.
    $('.chk_1:checked').each(function(){
        delchk.push($(this).val());
    });
    
   $.ajax({
      type : 'POST',
      url : _contextPath + "/community/boardGroup",
      data : {checkArray : delchk, bd_num : bd_num},
         success: function pageReload(){
               location.href= "${pageContext.request.contextPath}/board/sideboard_list?bd_num=${bd_num}";
           }
      });
}
function communityDeleteGroup() {
    var delchk = []; // key 값을 담을 배열
    //삭제 key value
    // chk라는 클래스를 가진 체크박스 중에 체크가 된
    // object들을 찾아서 delchk라는 배열에 담는다.
    $('.chk_1:checked').each(function(){
        delchk.push($(this).val());
    });
    
   $.ajax({
      type : 'POST',
      url : _contextPath + "/community/boardDeleteGroup",
      data : {checkArray : delchk},
         success: function pageReload(){
               location.href= "${pageContext.request.contextPath}/board/sideboard_list?bd_num=${bd_num}";
           }
      });
}
function boardNoticeGroup() {
    var delchk = []; // key 값을 담을 배열
    //삭제 key value
    // chk라는 클래스를 가진 체크박스 중에 체크가 된
    // object들을 찾아서 delchk라는 배열에 담는다.
    $('.chk_1:checked').each(function(){
        delchk.push($(this).val());
    });
    
   $.ajax({
      type : 'POST',
      url : _contextPath + "/community/boardNoticeGroup",
      data : {checkArray : delchk},
         success: function pageReload(){
               location.href= "${pageContext.request.contextPath}/board/sideboard_list?bd_num=${bd_num}";
           }
      });
}
$(document).ready(function() {
	// 달력 클릭 시 모달창 열기
$("#boardSet").on("click", function () {
	$('#myModal').show();
});
//모달창 Close 기능
	$("#close_btn").unbind('click').on('click', function() {
		$('#myModal').hide();
	});
//모달창 Close 기능
	$("#x_icon").unbind('click').on('click', function() {
		$('#myModal').hide();
	});
});

</script>
<body>
	<%@include file="/WEB-INF/views/header/headerBody.jsp"%>

	<div id="side">
		<button type="button" id="btn1"
			onclick="location.href='${pageContext.request.contextPath}/community/communityCreate'">글쓰기</button>
		<div id="side_text">
			<a id="button1" class="button1"><span id="span_hover"><img
					alt="image"
					src="${pageContext.request.contextPath}/board/img/right.png"
					style="width: 16px; height: 12px; transition: 0.5s;" id="img1"></span>
				<span id="span_none"> <img alt="image"
					src="${pageContext.request.contextPath}/board/img/white.png"
					style="width: 16px; height: 12px;" id="img1">
			</span>커뮤니티게시판</a>
			<ol id="scroll" style="display: none; list-style: none;">
				<c:forEach var="as" items="${boardListOfCommunity }">
					<li class="li">
					
					<a 
						href="${pageContext.request.contextPath}/community/sideboard_list?bd_num=${as.bd_num}">${as.bd_name}</a></li>
				</c:forEach>

			</ol>
		</div>
	</div>
	<div id="content">
			<div id="board_table">
				<section class="tool_bar">
					<ul class="tool_ul">
						<li><button type="button" class="btn2"onclick="location.href='${pageContext.request.contextPath}/community/write'">
								<img style=" width: 20px; height: 20px;" alt="image" src="${pageContext.request.contextPath}/board/img/pencil.png"><span style="font-weight: bold;"> 새글쓰기</span>
							</button></li>
			<c:if test="${sessionId =='admin'}">
						<li><button type="button" id="boardSet" class="btn2 btn_admin" >
								<img style=" width: 20px; height: 20px;" alt="image" src="${pageContext.request.contextPath}/board/img/move.png"><span style="font-weight: bold;"> 이동</span>
							</button></li>
						<li><button type="button" class="btn2 btn_admin" onclick="javascript:boardDeleteGroup()">
								<img style=" width: 20px; height: 20px;" alt="image" src="${pageContext.request.contextPath}/board/img/delete.png"><span style="font-weight: bold;"> 삭제</span>
							</button></li>
						<li><button type="button" class="btn2 btn_admin" onclick="javascript:boardNoticeGroup()">
									<img style=" width: 25px; height: 25px;" alt="image" src="${pageContext.request.contextPath}/board/img/megaphone.png"><span style="font-weight: bold;"> 공지로 등록</span>
							</button></li>
							  </c:if>
					</ul>
				</section>

			<table id="list_table"
				style="margin-top: 4%; border-top: 2px solid #EAEAEA;">
				<tr>
					<td
						style="text-align: center; border-bottom: 2px solid #EAEAEA; border-top: 2px solid solid #EAEAEA;">
						<input type="checkbox" name="check" id="chk_1"
						onclick='selectAll(this)'> <label for="chk_1"></label>
					</td>
					<td
						style="border-bottom: 2px solid #EAEAEA; border-top: 2px solid solid #EAEAEA;">번호</td>
					<td
						style="border-bottom: 2px solid #EAEAEA; border-top: 2px solid solid #EAEAEA;">제목</td>
					<td
						style="border-bottom: 2px solid #EAEAEA; border-top: 2px solid solid #EAEAEA;">작성자</td>
					<td
						style="border-bottom: 2px solid #EAEAEA; border-top: 2px solid solid #EAEAEA;">작성일</td>
					<td
						style="border-bottom: 2px solid #EAEAEA; border-top: 2px solid solid #EAEAEA;">조회</td>

				</tr>
				<c:forEach var="ps" items="${board_list}">
					<tr>
						<td style="text-align: center;">	<input type="checkbox" name="check" class="chk_1" value="${ps.ps_notice}"></td>
						<td>${ps.p_num}</td>
						<td><a
							href='${pageContext.request.contextPath}/community/view?p_num=${ps.p_num}'>${ps.p_name}</a></td>
						<td>${ps.m_id}</td>
						<td>${ps.p_regdate}</td>
						<td>${ps.p_view}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pageNum">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<a href="?currentPage=${pg.startPage-pg.pageBlock}"></a>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage}">
				<a href="?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<a href="?currentPage=${pg.startPage+pg.pageBlock}"></a>
			</c:if>
		</div>
	</div>
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<p>
				<span>게시판 관리 <img
					src="https://img.icons8.com/fluent-systems-regular/48/000000/x.png"
					style="width: 35px; height: 25px; float: right; cursor: pointer;"
					onclick="close_pop2();" id="x_icon" />
				</span>
			</p>
			<br>
			<p style="text-align: center; line-height: 1.5;"></p>
			<form id="modal_form" name="modal_form">
			<sec:csrfInput/>
				<table>
					<tr>
						<td>게시판선택</td>
						<td colspan="3">
							<select name="bd_num">
								<c:forEach var="boardListOfCommunity" items="${boardListOfCommunity}">
									  <option value="${boardListOfCommunity.bd_num}">${boardListOfCommunity.bd_name}</option>
								</c:forEach>							
							</select>
						</td>
					<tr>
						<td></td>
						<td><input type="button" value="그룹지정" onclick="javascript:communityGroup()"></td>
						<td><input type="submit" value="그룹삭제" formaction="${pageContext.request.contextPath}/community/communityDeleteGroup"></td>
						<td><input type="button" value="취소" id="close_btn"></td>
				</table>
			</form>
		</div>
	</div>
	
</body>
</html>