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
	Object objAdmin = request.getAttribute("adminyn"); 
	
	List<HotelVO> list = (List<HotelVO>)obj;
	int nCnt = list.size();

	String hotelprice="";
	String hotelname="";
	String memname="";
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
		    color: black;
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
		height:670px;
		position: relative;	/* 요소 자기 자신을 기준으로 배치 */
		margin-top: 35px;
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

	 .regionarea {
	    background: rgba(0, 0, 0, 0.5);
	    border-radius: 20px;
	    color: #fff;
	    font-weight: 700;
	    top: 10px; /* 조절할 수 있는 값으로 변경 */
	    left: 10px; /* 조절할 수 있는 값으로 변경 */
    	font-size: 20px;
	    height: 26px;
	    line-height: 26px;
	    padding: 0 9px;
	    position: static;
	}
	
	.regionarea::before {
	    content: '';
	    display: inline-block;
	    background: url('${pageContext.request.contextPath}/resources/images/지도.png') 0 0 / 100% 100% no-repeat;
	    width: 17px;
	    height: 20px;
	    margin-right: 3px;
        vertical-align: -1px;
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
	margin: 0px 130px;
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
    .datePickerBox, .payBox {
        padding: 8px;
        border: 2px solid #ccc; /* 테두리 추가 */
        text-align-last: center;
        margin-bottom:20px;
    }
    
    .payBox {
        font-weight: bold;
        width : 250px;
    }
    .datePickerBox label{
    	display: block;
    }
	
	input[type="text"] {
        border: none;
        outline: none;
        background-color: #F7FCFC;
    }

	.coment, .info ul, .name h3{
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
	
	.admin{
	margin-bottom:25px;
	text-align: center;
	}
	
	.admin a {
    margin-right: 10px; /* 링크 간의 간격 조절 */
    padding: 5px 15px;
    background-color: #0AA4B5;
    color: white;
    border: 0;
    border-radius: 10px;
	}
	
	#cardBtn {
	padding: 5px 15px;
    background-color: #0AA4B5;
    color: white;
    border: 0;
	border-radius: 10px;
    cursor: pointer;
	}
	
	#cardBtn:hover, #update-link:hover, #delete-link:hover {
	 background-color: #0bc5da;
	 transition-duration: 0.5s;
     }

	
	</style>
		
	<script type="text/javascript">
	   $(document).ready(function(){
		      console.log("숙소 상세페이지 접속");
		     
		   // 체크인일, 체크아웃일 DatePicker 설정 
		      $('#checkinDate, #checkoutDate').datepicker({
		          dateFormat: 'yy-mm-dd',
		          autoclose: true
		      }).on('changeDate', function (e) {
		          // 날짜 클릭 시, 날짜를 'yyyy-mm-dd' 형식으로 표시
		          $(this).val(e.format('yyyy-mm-dd'));
		      });
		     
	   		// 현재 날짜 구하기
	        var currentDate = new Date();
	        checkinDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1).toString().padStart(2, '0') 
	       				   + '-' + currentDate.getDate().toString().padStart(2, '0');
	        // 내일 날짜 구하기
	        var tomorrowDate = new Date();
	        tomorrowDate.setDate(tomorrowDate.getDate() + 1);
	        checkoutDate = tomorrowDate.getFullYear() + '-' + (tomorrowDate.getMonth() + 1).toString().padStart(2, '0') 
	        				+ '-' + tomorrowDate.getDate().toString().padStart(2, '0');
	     	// 최종 가격 계산 및 초기 표시
	        calculateAndDisplayDefaultPrice()
	        // 입실일, 퇴실일 텍스트 박스에 값 설정
	        $('#checkinDate').val(checkinDate);
	        $('#checkoutDate').val();

	        // Call the function to calculate and display the final price when datepicker is fully initialized
	        $('#checkinDate, #checkoutDate').on('changeDate', function () {
	            calculateAndDisplayFinalPrice();
	        });
	        
	        // 체크인 날짜 선택 이벤트
	        $('#checkinDate').change(function () {
	            checkinDate = new Date($(this).val());
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
	            checkinDate = new Date($('#checkinDate').val());
	            checkoutDate = new Date($(this).val());
	            if (checkoutDate <= checkinDate) {
	                alert('체크아웃 날짜는 체크인 날짜보다 미래여야 합니다.');
	                return;
	            }
	            // 최종 가격 계산 및 표시
	            calculateAndDisplayFinalPrice();
	        });
			
	     	// 최종 가격 계산 및 표시 함수
	        function calculateAndDisplayFinalPrice() {
	            checkinDate = new Date($('#checkinDate').val());
	            checkoutDate = new Date($('#checkoutDate').val());
	            var timeDiff = Math.abs(checkoutDate.getTime() - checkinDate.getTime());
	            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
	            hotelprice = diffDays * parseInt(<%= hvo.getHotelprice() %>);
	            console.log(finalPrice);
	            // 최종 가격을 표시할 div에 텍스트 설정
	            $('#finalPrice').text(formatNumber(hotelprice) + '원');
	            $('#hotelprice').val(hotelprice);
	        }
	        
	     	// 초기 1박 가격
	        function calculateAndDisplayDefaultPrice() {
	            // 기본 가격 표시
	            hotelprice = parseInt(<%= hvo.getHotelprice() %>);
	            $('#finalPrice').text('1박 요금 : ' + formatNumber(hotelprice) + '원');
	            $('#hotelprice').val(hotelprice);
	        }
	     	
	     	// 숫자를 콤마 형식으로 포매팅하는 함수
	        function formatNumber(number) {
	            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        }
	       
	     	
	     
	     	// 날짜 클릭 시, 날짜를 alert 대신에 달력에 yyyy-mm-dd 형식으로 표시
	      	 $('#checkinDate, #checkoutDate').on('changeDate', function() {
	            $(this).val(e.format('yyyy-mm-dd'));
	        });
	     
	        function formatDate(date) {
	            var day = date.getDate();
	            var month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더합니다.
	            var year = date.getFullYear();

	            // 날짜와 월이 한 자리 수일 경우 앞에 0을 추가합니다.
	            day = day < 10 ? '0' + day : day;
	            month = month < 10 ? '0' + month : month;

	            return year + '-' + month + '-' + day;
	        }
	     	
	        $(document).on("click", "#cardBtn", function(){
	        	
	        	if ($('#checkoutDate').val() === '') {
	        		alert("체크아웃날짜를 선택하세요.")
	                $('#checkoutDate').datepicker('show');
	                $('#checkoutDate').focus();
	        	} else{
				console.log("cardBtn >>> : ");
				 
				 var checkin = formatDate(checkinDate) + ' / 체크인시간 : (' + '<%= hvo.getHotelcheckin().replace("<br>", "&nbsp;/&nbsp;") %>' + ')';
				 var checkout = formatDate(checkoutDate) + ' / 체크아웃시간 : (' + '<%= hvo.getHotelcheckout().replace("<br>", "&nbsp;/&nbsp;") %>' + ')';
				 
				
				$('#hotelname').val('<%= hvo.getHotelname() %>');
				$('#hotelprice').val(hotelprice);
				
				$('#hotelOrderForm').attr({
					'action': 'hotelOrderForm?hotelnum=<%=hvo.getHotelnum()%>&hotelname=<%=hvo.getHotelname()%>&hotelprice=' + hotelprice + '&hotelcheckin=' + checkin + '&hotelcheckout=' + checkout,
					'method':'POST',
					'enctype':'multipart/form-data'
				}).submit();
	        	}
			});
		   });
	   
	   // 지도 및 패노라마 뷰를 초기화하고 숙소 정보에 따라 마커를 생성하여 지도에 표시하는 함수
	   function viewMap(name, mapx, mapy) {
	       // 지도 및 패노라마 컨테이너 생성
	       var mapContainer = $('<div id="map"></div>');
	       var panoContainer = $('<div id="pano"></div>');

	       // 기존 내용 제거 후 새로운 컨테이너 추가
	       $('#mapContainer').empty().append(mapContainer).append(panoContainer);

	       // 지도 생성 및 중심 위치 및 줌 설정
	       var map = new naver.maps.Map(mapContainer[0], {
	           center: new naver.maps.LatLng(mapy, mapx),
	           zoom: 18
	       });

	       // 마커 생성 및 지도에 추가
	       var marker = new naver.maps.Marker({
	           position: new naver.maps.LatLng(mapy, mapx),
	           map: map
	       });

	       // 패노라마 뷰 초기화
	       pano = new naver.maps.Panorama("pano", {
	           position: new naver.maps.LatLng(mapy, mapx),
	           pov: {
	               pan: -133,
	               tilt: 0,
	               fov: 100
	           }
	       });

	       // 패노라마 뷰 변경 시 지도 중심 위치 변경
	       naver.maps.Event.addListener(pano, 'pano_changed', function () {
	           var latlng = pano.getPosition();
	           if (!latlng.equals(map.getCenter())) {
	               map.setCenter(latlng);
	           }
	       });

	       // 스트리트 레이어 초기화 및 지도에 추가
	       var streetLayer = new naver.maps.StreetLayer();
	       naver.maps.Event.once(map, 'init', function () {
	           streetLayer.setMap(map);
	       });

	       // 스트리트 레이어 토글 버튼 설정
	       var btn = $('#street');
	       btn.on("click", function (e) {
	           e.preventDefault();
	           if (streetLayer.getMap()) {
	               streetLayer.setMap(null);
	           } else {
	               streetLayer.setMap(map);
	           }
	       });

	       // 스트리트 레이어 표시 여부에 따라 버튼 스타일 변경
	       naver.maps.Event.addListener(map, 'streetLayer_changed', function (streetLayer) {
	           if (streetLayer) {
	               btn.addClass('control-on');
	           } else {
	               btn.removeClass('control-on');
	           }
	       });

	       // 지도 클릭 시 패노라마 뷰의 위치 변경
	       naver.maps.Event.addListener(map, 'click', function (e) {
	           if (streetLayer.getMap()) {
	               var latlng = e.coord;
	               pano.setPosition(latlng);
	           }
	       });

	       // 정보 창 내용 생성
	       var contentString = [
	           '<div class="iw_inner">',
	           '   <h3>' + name + '</h3>',
	           '   </p>',
	           '</div>'
	       ].join('');

	       // 정보 창 생성 및 마커 클릭 시 표시
	       var infowindow = new naver.maps.InfoWindow({
	           content: contentString
	       });
	       naver.maps.Event.addListener(marker, "click", function (e) {
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
    <%@ include file="/main.jsp" %>

    <!-- 숙소 정보 서브 헤더 -->
    <div class="sub-header">
        <h3 class="sub-title">숙소정보</h3>

        <!-- 관리자 확인 태그 -->
        <% if ("Y".equals(objAdmin)) { %>
        <div class="admin">
            <a href="hotelUpdateForm?hotelnum=<%= hvo.getHotelnum() %>" class="update-link" id="update-link">수정</a>
            <a href="hotelDelete?hotelnum=<%= hvo.getHotelnum() %>" class="delete-link" id="delete-link"> 삭제</a>
        </div>
        <% } %>
    </div>

    <!-- 숙소 기본 정보 및 이미지 슬라이드 -->
    <div class="hotelSelect">
        <div class="detail">
            <div class="detail-basic">
                <!-- 이미지 슬라이드 -->
                <div class="slider">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <!-- 이미지 동적 생성 -->
                            <%if (hvo.getHotelimage().startsWith("http") || hvo.getHotelimage().startsWith("https")) { 
                                String[] imageUrls = hvo.getHotelimage().split(",");
                                for (String imageUrl : imageUrls) {
                            %>
                            <div class="swiper-slide">
                                <img src="<%= imageUrl.trim() %>">
                            </div>
                            <%  }} else { %>
                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/resources/fileupload/hotel/<%= hvo.getHotelimage() %>">
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <!-- 슬라이드 네비게이션 -->
                        <div class="page_box">
                            <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide"></div>
                            <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide"></div>
                        </div>
                    </div>
                </div>

                <!-- 숙소 기본 정보 -->
                <div class="txt-wrap">
                    <div class="title">
                        <span class="regionarea"><%= hvo.getRegionid() %></span><br><br>
                        <span class="name">
                            <h3><%= hvo.getHotelname() %></h3>
                        </span><br><hr>
                        <span class="info"><br>
                            <!-- 숙소 기본 정보 -->
                            <ul>
                                <li> 주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= hvo.getHoteladress() %> </li>
                                <li> 번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= hvo.getHoteltel().replace("<br>", "&nbsp;/&nbsp;").replace("<br />", "&nbsp;/&nbsp;") %></li>
                                <li> 체크인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= hvo.getHotelcheckin().replace("<br>", "&nbsp;/&nbsp;").replace("<br />", "&nbsp;/&nbsp;") %></li>
                                <li> 체크아웃 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= hvo.getHotelcheckout().replace("<br>", "&nbsp;/&nbsp;").replace("<br />", "&nbsp;/&nbsp;") %></li>
                            </ul>
                        </span>
                    </div><br>
                    <!-- 숙소 설명 -->
                    <div class="coment">
                        <p class="overview"><%= hvo.getHotelcoment() %></p>
                    </div>

                    <!-- 날짜 선택 및 예약 폼 -->
                    <div class="datePickerContainer">
                        <div class="datePickerBox">
                            <label for="checkinDate"> 체크인 </label>
                            <input type="text" id="checkinDate" readonly>
                        </div>
                        <div class="datePickerBox">
                            <label for="checkoutDate"> 체크아웃 </label>
                            <input type="text" id="checkoutDate" readonly>
                        </div>
                        <!-- 예약 폼 -->
                        <form form id="hotelOrderForm" action="hotelOrder" method="POST" enctype="multipart/form-data">
                            <div class="payBox">
                                <!-- 숨겨진 예약 정보 -->
                                <input type="hidden" id="hotelname" name="hotelname" class="hotelname"
                                    value="<%= hvo.getHotelname() %>" />
                                <input type="hidden" id="hotelprice" name="hotelprice" class="hotelprice"
                                    value="<%= hotelprice %>" />
                                <!-- 최종 가격 및 예약 버튼 -->
                                <span id="finalPrice"></span><br>
                                <span class="pay"><button type="button" id="cardBtn"> 바로 예약 </button></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 지도 표시 -->
        <hr class="next"><br>
        <div class="container">
            <div class="txt">
                <h2>지도</h2>
            </div>
            <div class="mapContainer" id="mapContainer">
                <!-- 지도 초기화 스크립트 -->
                <script type="text/javascript">
                    viewMap('<%= hvo.getHotelname() %>', <%= hvo.getHotelmapx() %>, <%= hvo.getHotelmapy() %>);
                </script>
            </div>
        </div>
    </div>

    <!-- Swiper 라이브러리 스크립트 -->
    <script>
        new Swiper('.swiper-container', {
            slidesPerView: 1, // 동시에 보여줄 슬라이드 갯수
            spaceBetween: 10, // 슬라이드 간 간격
            slidesPerGroup: 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는 게 좋음
            loopFillGroupWithBlank: true, // 그룹 수가 맞지 않을 경우 빈칸으로 메우기
            loop: true, // 무한 반복 여부
            pagination: { // 페이징
                el: '.swiper-pagination',
                clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },
            navigation: { // 네비게이션
                nextEl: '.swiper-button-next', // 다음 버튼 클래스명
                prevEl: '.swiper-button-prev', // 이전 버튼 클래스명
            },
        });
    </script>

</body>

</html>