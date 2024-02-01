<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="take.a.trip.adminBoard.vo.AdminBoardVO" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8");%> 
<%	
	Object obj = request.getAttribute("listU");
	if (obj == null) return;

	List<AdminBoardVO> list = (List<AdminBoardVO>)obj;	
	int nCnt = list.size();
	
	AdminBoardVO _abvo = null;
	if (nCnt == 1){
		_abvo = list.get(0);
	}	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//  취소
		$(document).on("click", "#ccBtn", function(e){
			alert("취소");
			e.preventDefault();
			$("#adBoardUpdate").attr({ "method":"GET", "action":"adminBoardSelectAll"}).submit();
			//location.href="adminBoardSelect";
		});	
		
		// U
		$(document).on("click", "#abbUpdateBtn", function(e){
			alert("수정하기");
			e.preventDefault();
			$("#adBoardUpdate").attr({ "method":"GET", "action":"adminBoardUpdate"}).submit();
		});
	});
	

</script>
<style type="text/css">
        h3 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin: 0 auto;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            /*text-align: center;*/
        }
        
        td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        
         /* 텍스트 박스 스타일 */
	    textarea {
	        width: 100%; /* 테이블의 100% 크기로 조절 */
	        box-sizing: border-box; /* 패딩과 테두리를 포함한 전체 크기로 설정 */
	        
	    }
	    
	    .mem {
		    text-align: left;
		    display: inline-block;
		}
		
		img {
	        max-width: 100%; /* 이미지가 부모 요소를 넘어가지 않도록 최대 너비 설정 */
	        height: auto; /* 높이는 자동으로 조절 */
	        display: block; /* 인라인 요소에서 블록 요소로 변환하여 가로로 정렬 */
	    }

		
        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: flex; 
        	float: right; /* 오른쪽으로 이동 */
        }

        button:hover {
            background-color: #45a049;
        }
        
        .right button {
		    margin-right: 10px;
		}
        
       
			table {
				text-align: center;	
				margin: 0 auto;
			}
			
			#miniSearchForm {
				text-align: center;	
			}
			
			.list_content ul {
				display: flex; 		/* flex : 수평으로 나열*/
				flex-wrap: wrap;	/* 화면 크기에 따라 자동 줄바꿈 */
				justify-content: center; /* 가로 방향으로 가운데 정렬  ( 가로축 - 중심축 )*/
				
			}
			
			ul, li {
				list-style: none;	/* 목록 스타일 제거*/
			}
			
			* {
				margin: 0;		/* 여백 제거*/
				padding: 0;		/* 패딩 제거*/
			}


			.img {
				display: block;	/* 한 줄 모두 차지*/
			}
			
			.list_content ul li .img {	/* 이미지 감싸는 요소 (span)*/
			    height: 250px;
			    position: relative;	/* 요소 자기 자신을 기준으로 배치 */
			}		
			
			.list_content ul li .img img{
    			border-radius: 10px;	/* 외곽선 둥글게*/
			}	
						
			.list_content ul li {	/* 관광지 목록의 각 항목*/
			    width: 380px;
			    margin: 0 20px 40px 0;
			    position: relative;	/* 요소 자기 자신을 기준으로 배치 */
			}
			
			
			a:link, a:visited, a:focus, a:active { /* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
			    text-decoration: none;
			    color: black;
			}	
			
							
			
			.img img {
				width: 100%; /* width, height 부모 요소에 대해 이미지가 가득 차도록 함*/
				height: 100%; 
				object-fit: cover; /*  이미지가 자동으로 크기 조정되어 부모 요소에 가득 차도록 설정, 이미지는 종횡비를 유지하고 주어진 크기를 채움, 이미지가 맞게 잘림 */
				object-position: 50% 50%;	/* 이미지 중앙 정렬*/
			}
			
			img {
			    border: 0 none;	/* 외곽선 제거, 두께 0, 유형 없음*/
			}			
		

			body {
			    font-size: 17px;
			}
						
			/*카테고리*/
			#topMenu { 

			 width: 100%; 
			 margin: 0 auto;
			 }
			 
			 #topMenu ul{
				 list-style-type: none;
				 margin: 0px;
				 padding: 0px; 
				 font-size : 20px;
				 text-align: center;
			 }
			 
			 #topMenu ul li 
			 { 
			 list-style: none; 
			 display: inline-block;
			 line-height: 30px; 
			 vertical-align: middle; 
			 text-align: center;
			 position: relative;
			 }
			 
			 .submenuLink{
				 text-decoration:none;
				 display: block;
				 width: 150px;
				 font-size: 12px;
				 font-weight: bold;
				 font-family: "Trebuchet Ms", Dotum;
			 }
			 
			  #topMenu { 
			 color: white; 
			 background-color: #aaa; }
			
			 .submenuLink{
				 color: white;
				 background-color: #aaa;
				 border: solid 1px white;
				 margin-top: -1px;
			 }
			 
			 .sb{
				 position: absolute;
				 height: 0px;
				 overflow: hidden;
				 transition: height .2s;
			 }
			 
			 .topMenuLi:hover .sb{
				 height: 100px;
			 }
			 
			 .submenuLink:hover { 
			 color: black;
			 background-color: #aaa;
			 }		
			 
			 h1 {
			 	text-align: center;
			 }
			 
			 
		 	 .area {
		    position: absolute;
		    background: rgba(0, 0, 0, 0.5);
		    border-radius: 20px;
		    color: #fff;
		    font-weight: 700;
		    top: 10px; /* 조절할 수 있는 값으로 변경 */
		    left: 10px; /* 조절할 수 있는 값으로 변경 */
			}
	
			.area::before {
			    content: '';
			    display: inline-block;
			    background: url('${pageContext.request.contextPath}/resources/images/지도.png') 0 0 / 100% 100% no-repeat;
			    width: 11px;
			    height: 13px;
			    margin-right: 3px;
		        vertical-align: -1px;
			}
			 
		
			.area {
			    height: 26px;
			    line-height: 26px;
			    padding: 0 10px;
			    font-size: 13px;
			}
			
			.name strong {
			    font-size: 16px;
			    color: #000;
			}
	
		
		
    </style>
    <!-- 폰트 어썸 CDN -->
    <script src="https://kit.fontawesome.com/2211a5118a.js" crossorigin="anonymous"></script>	
</head>
<body>
<!-- 검색 -->
		<div id="header">
			<table>
				<tr>
					<td>
					<!-- 이미지 아이콘 -->
						<a href="spot_IsudSelectAll">
						<!-- <img src="${pageContext.request.contextPath}/resources/images/img_spot/지도.png" width="50px" height="50px" title="로고 이미지">  -->
							<i class="fa-solid fa-plane-up fa-xl"></i> <!-- 폰트사이즈 :  fa-2xs - 0.625em - 10px / fa-xs - 0.75em - 12px / fa-sm - 0.875em - 14px / fa-lg - 1.25em - 20px / fa-xl - 1.5em - 24px / fa-2xl - 2em - 32px  -->
						</a>
						&nbsp;&nbsp;
					</td>
					<td>
					<!-- 제목 -->
					<h1>여행가기 좋은날</h1>
					</td>
				</tr>
			</table>
			<br>
				<form name="miniSearchForm" id="miniSearchForm" action='spot_Search'> 
				<select id="searchFilter_1" name="searchFilter_1" style="width:100px;font-size:15px;">
					<option value="key_01">지역별</option>
					<option value="key_02">분야별</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" 
				style="width:200px;height:30px;font-size:15px;">
				<input type="button" id="search_btn" name="search_btn" value="검색">
				
				<input type="button" name="login" id="loginBtn" value="로그인" onclick="location.href='#'" >
				</form>		
		</div>
		<br>
			<div class="topnav">
				<!--메뉴-->
				<nav id="topMenu" >
					 <ul>
						 <li class="topMenuLi">
						 <a class="menuLink" href="#content1">여행정보</a>
						 	 <ul class ="sb">
								  <li><a href="spot" class="submenuLink" >관광정보</a></li>
								  <li><a href="spot_ISUD" class="submenuLink" >관광정보(ISUD)</a></li>
						  	</ul>
						 </li>							  
						  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>					  
						 <li class="topMenuLi">
						 <a class="menuLink" href="#content2">숙소예약</a>
						 	<ul class ="sb"> 
								 <li><a href="<%= request.getContextPath() %>/hotel/hotel_main" class="submenuLink" >숙소정보</a></li>
						 	</ul>
						 </li>
						  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>					  
						 <li class="topMenuLi">
						 <a class="menuLink" href="#content3">게시판</a>
						 	<ul class ="sb"> 
								 <li><a href="#" class="submenuLink" >자유 게시판</a></li>
								 <li><a href="#" class="submenuLink" >공지사항 게시판</a></li>
						 	</ul>
						 </li>				 
					 </ul> 
				 </nav>
			</div>	



<h3 style="text-align:center;">게시글 내용</h3>
<hr>
<form name="adBoardUpdate" id="adBoardUpdate">
<table>
<tr>
<td colspan="2" align="center">공지사항 수정하기</td>
</tr>
<tr>
<td>글번호</td>
<td><input type="text" class="mem" name="adboardnum" id="adboardnum" value="<%= _abvo.getAdboardnum() %>" 
			style="width:100px; height:30px; font-size:16px;" readonly/></td>
</tr>
<tr>
<td>제목</td>
<td>
<input type="text" class="mem" name="adboardtitle" id="adboardtitle" value="<%= _abvo.getAdboardtitle() %>" 
			style="width:100%; height:30px; font-size:16px;"/>
</td>
</tr>
<tr>
<td>작성자</td>
<td><input type="text" class="mem" name="memnum" id="memnum" value="<%=  _abvo.getMemnum() %>" 
			style="width:300px; height:30px; font-size:16px;" readonly/></td>
</tr>

<tr>
<td>내용</td>
<td>
<textarea name="adboardcoment" id="adboardcoment" cols="70" rows="10" style="font-size: 18px;"><%= _abvo.getAdboardcoment() %>					
</textarea>
</td>
</tr>
<tr>
<td>사진</td>
<td> 
<img src="${pageContext.request.contextPath}/resources/fileupload/adminboard/<%= _abvo.getAdboardimage() %>" 
			border="1" width="100" height="100" alt="image">
</td>
</tr>
<tr>
<td>등록일</td>
<td>
<input type="text" class="mem" name="insertdate" id="insertdate" value="<%= _abvo.getInsertdate() %>" 
		style="width:100%; height:30px; font-size:16px;" readonly />		      
</td>
</tr>	 
<tr>
<td>수정일</td>
<td> 
<input type="text" class="mem" name="updatedate" id="updatedate" value="<%= _abvo.getUpdatedate() %>" 
		style="width:100%; height:30px; font-size:16px;" readonly />		      
</td>
</tr>
<tr>
	<td colspan="5" class="right">
	<button type="button" value="수정" id="abbUpdateBtn">수정하기</button>
	<button type="button" value="취소" id="ccBtn">취소</button>
    </td>      	
</tr>
</table>
</form>
</body>
</html>