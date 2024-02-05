<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.apache.log4j.LogManager"%>

<%@ page import="take.a.trip.hotel.vo.HotelVO" %> 
<%@ page import="java.util.List" %>  

<%@ page import="take.a.trip.hotel.util.CommonUtils" %>

<% request.setCharacterEncoding("UTF-8");%>	
<% 	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("hotelSelect 페이지");	
	
%>    
<%

	Object obj = request.getAttribute("selectList");

	List<HotelVO> list = (List<HotelVO>)obj;
	int nCnt = list.size();
	
	String hotelprice="";
	HotelVO hvo = null;
	
	if(nCnt==1){
	hvo = list.get(0);
	hotelprice = hvo.getHotelprice();
	
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Hotel Main</title>
    <!-- 기존 jQuery 제거 -->
    <!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
    <!-- 최신 버전의 jQuery 로딩 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.css">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zsrcsa9kp7&submodules=panorama"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- 슬라이드 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 스타일 -->
		<style type="text/css">
		
		

		
		* {
			margin: 0;		/* 여백 제거*/
			padding: 0;		/* 패딩 제거*/
		}


		.img {
			display: block;	/* 한 줄 모두 차지*/
		}
		
		
		a:link, a:visited, a:focus, a:active {
		    text-decoration: none;
		}	/* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
		
						
		
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
		
		div {
		box-sizing: border-box;
		}
				
	/*카테고리*/
	#topMenu { 
	 height: 50px; 
	 width: 100%; 
	 margin: 0 auto;
	 }
	 
	 #topMenu ul{
		 list-style-type: none;
		 margin: 0px;
		 padding: 0px; 
		 font-size : 20px;
	 }
	 
	 #topMenu ul li 
	 { 
	 list-style: none; 
	 display: inline-block;
	 line-height: 30px; 
	 vertical-align: middle; 
	 text-align: center;
	 position: relative;
	 text-align: -webkit-match-parent;
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


    
	    .swiper-pagination {
	     position: absolute;
	     left: 50%;
	     bottom: 20px;
	     transform: translateX(-50%);
	     z-index: 10;
	     display: flex;
	    }
	
		.swiper-pagination-bullet-active {
	    background-color: #fff;
	    }
	
		.swiper-container{
		height:700px;
		position: relative;	/* 요소 자기 자신을 기준으로 배치 */
		}
	
		.swiper-slide {
	    align-items: center;
	    justify-content: center;
		}

	.swiper-slide img {
	    width: 100%; /* width, height 부모 요소에 대해 이미지가 가득 차도록 함*/
		height: 100%; 
		object-fit: fill; /*  이미지가 자동으로 크기 조정되어 부모 요소에 가득 차도록 설정, 이미지는 종횡비를 유지하고 주어진 크기를 채움, 이미지가 맞게 잘림 */
		object-position: 50% 50%;	/* 이미지 중앙 정렬*/
	}
		 
	 .area {
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
	    width: 17px;
	    height: 20px;
	    margin-right: 3px;
        vertical-align: -1px;
	}
	 

	.area {
	   	font-size: 20px;
	    height: 26px;
	    line-height: 26px;
	    padding: 0 9px;
	    border-radius: 20px;
	    position: static;
	}
	
	.sub-title{
	font-size: 24px;
    padding: 24px 0;
    line-height: 1;
    color: #000;
    font-weight: 800;
    text-align: center;
	}
	
	.sub-header{
	border-bottom: 2px solid #000;
	padding: 10px 0 0;
    height: auto;
    margin-left: 100px;
    margin-right: 100px;
	}
	
	.next {
   	margin-left: 100px;
    margin-right: 100px;
    
	}
	
	.detail-basic{
	padding-bottom: 80px;
    display: flex;
    justify-content: space-between;
	}
	
	.slider {
	flex: 1; /* 나머지 공간을 모두 채우도록 설정 */
    max-width: 40%; /* 최대 너비 설정 */
	margin: 0px 100px;
	}
	
	.txt-wrap {
		flex: 1; /* 나머지 공간을 모두 채우도록 설정 */
	    width: 55%; /* 혹은 다른 크기로 조절할 수 있습니다 */
	    margin-right:200px;
	}
		
	.detail {
    padding-top: 20px;

	}
	
	.swiper-button-prev,
	.swiper-button-next {
	    color: #000; /* 아이콘 색상 설정 */
	}
	
	.name {
	font-size:23px;
	}
	
	.info li {
	margin-left: 25px;
	margin-bottom:15px;
	font-weight: bold;
	}
	
	.container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      align-items: flex-start;
    }
	
	.txt{
	width: 15%;
	text-align-last: center;
	}
	
	.mapContainer {
      width: 30.3%; /* 지도 컨테이너의 최대 너비 설정 */
      margin-right: auto;
      height: 450px 
    }

    /* 입실일, 퇴실일 부분의 스타일도 조절해야 할 수 있습니다. */
    .datePickerContainer {
        margin-bottom: 10px; /* 날짜 선택 부분 간의 간격 조절 */
    }
    
    .datePickerContainer {
        display: flex;
        justify-content: space-around; /* 각 요소 간의 여백을 고르게 배분 */
        margin-top: 40px; /* 필요에 따라 조절 */
    }

    .datePickerBox {
        padding: 10px;
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 35px; /* 모서리를 둥글게 만듦 */
        text-align-last: center;
        margin-bottom:20px;
    }
    
    .datePickerBox label{
    	display: block;
    }
    
	
	input[type="text"] {
        border: none;
        outline: none;
    }
    
    #finalPrice {
	
	}
    
	.coment{
	background-color:#f7f7f7;
	border-radius: 10px;
	padding: 20px;
    font-weight: bold;
    color:#444;
	}
	
	.pay {
	font-size:25px;
	}
	
	#mapContainer {
        display: flex;
        width: 100%;
        height: 600px;
        margin-bottom: 30px;
    	margin-top: 30px;
    }

    #map,
    #pano {
        flex: 1;
        height: 100%;
    }

	#map{
	margin-left:100px;
	}
	
	#pano{
	margin-right:100px;
	}

	</style>
		
	<script type="text/javascript">
	   $(document).ready(function(){
		      console.log("숙소 상세페이지 접속");
		      
		      $('#checkinDate, #checkoutDate').datepicker({
		          format: 'yyyy-mm-dd',
		          autoclose: true
		      });
		      
		   // 현재 날짜 구하기
	        var currentDate = new Date();
	        var formattedCurrentDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1).toString().padStart(2, '0') + '-' + currentDate.getDate().toString().padStart(2, '0');

	        // 내일 날짜 구하기
	        var tomorrowDate = new Date();
	        tomorrowDate.setDate(tomorrowDate.getDate() + 1);
	        var formattedTomorrowDate = tomorrowDate.getFullYear() + '-' + (tomorrowDate.getMonth() + 1).toString().padStart(2, '0') + '-' + tomorrowDate.getDate().toString().padStart(2, '0');

	     	// 최종 가격 계산 및 초기 표시
	        calculateAndDisplayDefaultPrice()

	        // 입실일, 퇴실일 텍스트 박스에 값 설정
	        $('#checkinDate').val(formattedCurrentDate);
	        $('#checkoutDate').val(formattedTomorrowDate);

	        // 체크인 날짜 선택 이벤트
	        $('#checkinDate').change(function () {
	            var checkinDate = new Date($(this).val());
	            var nextDay = new Date(checkinDate);
	            nextDay.setDate(checkinDate.getDate() + 1);

	            // 체크인 날짜 선택 시, 체크아웃 날짜를 체크인 날짜의 다음 날짜로 설정
	            $('#checkoutDate').datepicker('setDate', nextDay);

	            // 체크아웃 날짜 텍스트 상자로 포커스 이동
	            setTimeout(function () {
	                $('#checkoutDate').focus();
	            }, 0);

	            // 최종 가격 계산 및 표시
	            calculateAndDisplayFinalPrice();
	        });

	        // 체크아웃 날짜 선택 이벤트
	        $('#checkoutDate').change(function (e) {
	            e.preventDefault();  // 기본 동작 막기
	            e.stopPropagation();  // 이벤트 전파 중지

	            var checkinDate = new Date($('#checkinDate').val());
	            var checkoutDate = new Date($(this).val());

	            if (checkoutDate <= checkinDate) {
	                alert('체크아웃 날짜는 체크인 날짜보다 미래여야 합니다.');
	                return;
	            }

	            // 최종 가격 계산 및 표시
	            calculateAndDisplayFinalPrice();
	        });
			
	     	// 최종 가격 계산 및 초기 표시 함수
	        function calculateAndDisplayDefaultPrice() {
	            // 기본 가격 표시
	            var hotelprice = parseInt(<%= hvo.getHotelprice() %>);
	            $('#finalPrice').text('이용요금: ' + hotelprice + '원');
	        }
	        
	     // 최종 가격 계산 및 표시 함수
	        function calculateAndDisplayFinalPrice() {
	            var checkinDate = new Date($('#checkinDate').val());
	            var checkoutDate = new Date($('#checkoutDate').val());

	            var timeDiff = Math.abs(checkoutDate.getTime() - checkinDate.getTime());
	            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

	            var hotelprice = diffDays * parseInt(<%= hvo.getHotelprice() %>);

	            console.log(finalPrice);
	            // 최종 가격을 표시할 div에 텍스트 설정
	            $('#finalPrice').text('이용요금: ' + hotelprice + '원');
	        }
	        
		      $("#search_btn").click(function(){
		         alert('검색합니다.');
		         
		         $("#miniSearchForm").attr({
		            "method":"GET",
		            "action":"hotelSearch"
		         }).submit();
		      }); 
		   });
	   
	   function viewMap(name,mapx,mapy) {
			
	        var mapContainer = $('<div id="map"></div>');
	        var panoContainer = $('<div id="pano"></div>');
	        $('#mapContainer').empty().append(mapContainer).append(panoContainer);

	        var map = new naver.maps.Map(mapContainer[0], {
	            center: new naver.maps.LatLng(mapy, mapx),
	            zoom: 18
	        });

	        var marker = new naver.maps.Marker({
	            position: new naver.maps.LatLng(mapy, mapx),
	            map: map
	        });
	        
	        pano = new naver.maps.Panorama("pano", {
                position: new naver.maps.LatLng(mapy, mapx),
                pov: {
                    pan: -133,
                    tilt: 0,
                    fov: 100
                }
            });
	        
	        naver.maps.Event.addListener(pano, 'pano_changed', function () {
                var latlng = pano.getPosition();

                if (!latlng.equals(map.getCenter())) {
                    map.setCenter(latlng);
                }
            });
	        
	        var streetLayer = new naver.maps.StreetLayer();
            naver.maps.Event.once(map, 'init', function () {
                streetLayer.setMap(map);
            });

            var btn = $('#street');
            btn.on("click", function (e) {
                e.preventDefault();

                if (streetLayer.getMap()) {
                    streetLayer.setMap(null);
                } else {
                    streetLayer.setMap(map);
                }
            });
            
            naver.maps.Event.addListener(map, 'streetLayer_changed', function (streetLayer) {
                if (streetLayer) {
                    btn.addClass('control-on');
                } else {
                    btn.removeClass('control-on');
                }
            });
            
            naver.maps.Event.addListener(map, 'click', function (e) {
                if (streetLayer.getMap()) {
                    var latlng = e.coord;
                    pano.setPosition(latlng);
                }
            });
		   
	        var contentString = [
	            '<div class="iw_inner">',
	            '   <h3>' + name + '</h3>',
	            '   </p>',
	            '</div>'
	        ].join('');
		   
	        var infowindow = new naver.maps.InfoWindow({
	            content: contentString
	        });

	        naver.maps.Event.addListener(marker, "click", function(e) {
	            if (infowindow.getMap()) {
	                infowindow.close();
	            } else {
	                infowindow.open(map, marker);
	            }
	        });

	        infowindow.open(map, marker, pano);
	    }
</script>
</head>
<body>
	<div class="header">
			<!-- 이미지 아이콘 -->
			<a href="#">
			<img src="#" width="50px" height="50px" title="로고 이미지">
			</a>
			<!-- 제목 -->
			<h1>여행가기 좋은날</h1>
			<!-- 조건 검색 --> 	
			<form name="miniSearchForm" id="miniSearchForm"> 
			<select id="searchFilter" name="searchFilter" style="width:100px;font-size:15px;">
				<option value="key_01">지역</option>
				<option value="key_02">숙소명</option>
			</select>			
			<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" 
			style="width:200px;height:30px;font-size:15px;">
			<input type="submit" id="search_btn" name="search_btn" value="검색">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<input type="button" name="logout" id="logoutBtn" value="로그아웃" onclick="location.href='#'" >
			&nbsp;&nbsp;&nbsp;
			<input type="button" name="mypage" id="MyPageBtn" value="마이페이지" onclick="location.href='#'" >
 
			</form>
	</div>
	
	<div class="topnav">
			<!--메뉴-->
			<nav id="topMenu" >
				 <ul>
					 <li class="topMenuLi">
					 <a class="menuLink" href="#content1">여행정보</a>
					 	 <ul class ="sb">
							  <li><a href="<%= request.getContextPath() %>/spot/spot" class="submenuLink" >관광정보</a></li>
							  <li><a href="spot_ISUD" class="submenuLink" >관광정보(ISUD)</a></li>
					  	</ul>
					 </li>							  
					  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>					  
					 <li class="topMenuLi">
					 <a class="menuLink" href="#content2">숙소예약</a>
					 	<ul class ="sb"> 
							 <li><a href="hotel_main" class="submenuLink" >숙소정보</a></li>
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
		
		<div class="sub-header">
			<h3 class="sub-title">숙박</h3>
				</div>
				<div class="hotelSelect">
					<div class="detail">
						<div class="detail-basic">
						<div class="slider">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<%
								        String[] imageUrls = hvo.getHotelimage().split(",");
								        for (String imageUrl : imageUrls) {
								    %>
										<div class="swiper-slide">
											 <img src="<%= imageUrl.trim() %>">
										</div>
									<%
										}
									%>
								</div>
								<div class="page_box">
									<div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide"></div>
									<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide"></div>
								</div>
							</div>
						</div>	
						<div class="txt-wrap">
							<div class="title">
								<span class="area">
									<%= hvo.getRegionid() %>
								</span><br><br>
								<span class="name">
									<h3><%= hvo.getHotelname() %></h3>
								</span><br><hr>
								<span class="info"><br>
									<ul>
										<li> 주소	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= hvo.getHoteladress() %> </li>
										<li> 번호	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= hvo.getHoteltel().replace("<br>", "&nbsp;/&nbsp;") %>
										<li> 체크인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= hvo.getHotelcheckin().replace("<br>", "&nbsp;/&nbsp;") %>
										<li> 체크아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= hvo.getHotelcheckout().replace("<br>", "&nbsp;/&nbsp;") %>
									</ul>
								</span>
								</div><br>
								<div class="coment">
									<p class="overview">
										<%= hvo.getHotelcoment() %>
									</p>
								</div>
								<div class="datePickerContainer">
								    <div class="datePickerBox">
								        <label for="checkinDate"> 체크인 </label>
								        <input type="text" id="checkinDate" readonly>
								    </div>
								    <div class="datePickerBox">
								        <label for="checkoutDate"> 체크아웃 </label>
								        <input type="text" id="checkoutDate" readonly>
								    </div>
								   <div >
								   		<span id="finalPrice"></span><br>
								   		<span class="pay"><a href=""> 결제하기 </a></span>
									</div>
								</div>
							</div>
						</div>
						<hr class="next"><br>
						<div class="container">
						<div class="txt">
							<h2>지도</h2>
						</div>
						<div class="mapContainer" id="mapContainer">
								    <script type="text/javascript">
								        viewMap('<%= hvo.getHotelname() %>', <%= hvo.getHotelmapx() %>, <%= hvo.getHotelmapy() %>);
								    </script>
						</div>


					</div>
				</div>
			</div>
			
		<script>
			new Swiper('.swiper-container',{
				
				slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
				spaceBetween : 10, // 슬라이드간 간격
				slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
			
				// 그룹수가 맞지 않을 경우 빈칸으로 메우기
				// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
				loopFillGroupWithBlank : true,
			
				loop : true, // 무한 반복 여부
			
				pagination : { // 페이징
					el : '.swiper-pagination',
					clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
				},
				navigation : { // 네비게이션
					nextEl : '.swiper-button-next', // 다음 버튼 클래스명
					prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
				},
			});
		</script>
		
		
		
	</body>
</html>		