<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="org.json.JSONArray"%>
<%@page import="com.third.severance.dto.DoctorVO"%>





<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">


<main>


                <%
//                System.out.println(request.getAttribute("ReservationResponse"));
//				System.out.println(request.getAttribute("nextMonthResData"));
//	if ((Integer)request.getAttribute("error") == 1){
//		out.println("<script>alert('오류발생1!!');history.back();</script>");
//	}

	//유저정보 획득
//	String userName = LoginedUserInfo.name;
//	String userPhone = LoginedUserInfo.phone;
//	String userEmail = LoginedUserInfo.email;


	//detail data
					System.out.println((DoctorVO)request.getAttribute("detail"));
	DoctorVO dtvo = (DoctorVO)request.getAttribute("detail");

	//JSON 형식으로 달의 날자별 예약현황을 전송받음
//	System.out.println(request.getAttribute("thisMonthResData"));
	JSONArray thisMonthResData = (JSONArray)request.getAttribute("thisMonthResData");

//	System.out.println(request.getAttribute("nextMonthResData"));
	JSONArray nextMonthResData = (JSONArray)request.getAttribute("nextMonthResData");

	System.out.println(dtvo.getDaylimit());
//	//예약가능 요일 (일~월, 가능0 불가능1)
	char[] possibleDay = (dtvo.getDaylimit()).toCharArray();

	System.out.println("detail");
	//예약가능 시간 (start time~end time) end - start = 이용가능시
//	int startTime = dtvo.getStartTime();
//	int endTime = dtvo.getEndTime();

	//총 이용 가능 시간
//	int totalUsingTime = endTime - startTime;

	//시간당 가격
//	int price = dtvo.getPrice();
%>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

		//예약이 가득찬 날들의 배열
		var thisMonthFullDateList = new Array();
		<c:forEach items="${thisMonthFullDateList}" var = "date">
		thisMonthFullDateList.push(${date});
		</c:forEach>

		var nextMonthFullDateList = new Array();
		<c:forEach items="${nextMonthFullDateList}" var = "date">
		nextMonthFullDateList.push(${date});
		</c:forEach>
                //---------------- calendar --------------------------

                //date객체 획득. 가변
                var today = new Date();
				// console.log("today:"+today);

                //today 보조. 고정
                var date = new Date();

                //선택되있던 셀 객체 저장
                var selectedCell;

				//오늘에 해당하는 년
				var realYear = date.getFullYear();

                //오늘에 해당하는 월
                var realMonth = date.getMonth()+1;
				// console.log("date.getMonth() 출력 : "+date.getMonth());

                var realToDay = date.getDate()

				//선택된 월, 일
				var selectedYear = null;
                var selectedMonth = null;
                var selectedDate = null;

                <%--//예약가능 요일 계산해 배열 (일~월, 가능0 불가능1)--%>
                const possibleDay = "<%=possibleDay%>";



		//전달 달력
		function prevCalendar(){
			// if (today.getMonth() < realMonth){
			// 	alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
			// 	return false;
			// }
			today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
			buildCalendar();
		}
		//다음달 달력
		function nextCalendar(){
			// if(today.getMonth()+1 == (realMonth + 1)){
			// 	alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
			// 	return false;
			// }
			today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
			buildCalendar();
		}










                // //전달 달력
                // function prevCalendar(){
				// 	// today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
				// 	// if(today.getMonth()==1)
				// 	// {today = new Date(today.getFullYear()-1, 12, today.getDate());}
				// 	//
				// 	//
				// 	//
				// 	// console.log("이전달 이동시 오늘:"+today);
				//
				// 	if (today.getMonth() < realMonth){
                //         alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
				// 		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
				// 		console.log("이전달 이동실패시 오늘:"+today);
                //         return false;
                //     } else if(realMonth ==1){alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다."); return false;}
				//
				//
                //     // today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
				//
				//
				// 	// if(today.getMonth()==1)
				// 	// {today = new Date(today.getFullYear()-1, 12, today.getDate());}
				//
				// 	console.log("최종 오늘:"+today);
				//
				// 	buildCalendar();
                // }
                // //다음달 달력
                // function nextCalendar(){
				// 	// today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
				// 	//
				// 	// if(today.getMonth()==12)
				// 	// {today = new Date(today.getFullYear()+1, 1, today.getDate());}
				// 	//
				// 	// if(realMonth==12){realMonth = 0;}
				// 	//
				// 	// console.log("다음달 이동시 오늘:"+today);
				// 	// console.log("realMonth+1:"+(realMonth+1));
				//
                //     if(today.getMonth() >= (realMonth + 1)){
                //         alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
				// 		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
				// 		console.log("다음달 이동실패시 오늘:"+today);
                //         return false;
                //     }
				//
				//
				//
				// 	console.log("다음달 이동시 오늘:"+today);
				//
				// 	buildCalendar();
                // }

		// function funcclickDate(){
		// 	selectedTimeAndTotalPriceInit();
		// 	//선택된 날의 연, 월, 일 계산 (일자의 경우 id속성 참조)
		//
		// 	clickedYear = today.getFullYear();
		// 	clickedMonth = (1 + today.getMonth());
		// 	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
		//
		// 	clickedDate = this.getAttribute('id');
		// 	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
		//
		// 	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
		//
		// 	//하단에 예약일시 표시
		// 	inputField = document.getElementById("selectedDate");
		// 	inputField.value = clickedYMD;
		//
		// 	//선택된 월, 일 변수 저장
		// 	selectedYear = today.getFullYear();
		// 	selectedMonth = today.getMonth() + 1;
		// 	selectedDate = this.getAttribute('id');
		//
		// 	//선택된 셀 색 변화
		// 	if(selectedCell != null){
		// 		selectedCell.bgColor = "#FFFFFF";
		// 	}
		// 	selectedCell = this;
		// 	this.bgColor = "#fbedaa";
		//
		// 	//time table 생성
		// 	timeTableMaker(today.getMonth() + 1,this.getAttribute('id'));
		// }








                //달력 제작 (이번달 기준)
                function buildCalendar(){
			row = null;
			cnt = 0;

			var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
			var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);

			console.log("First Date:", firstDate); // 이번 달 첫 날
			console.log("Last Date:", lastDate); // 이번 달 마지막 날


			//현재 참조중인 년
			nowYear = today.getFullYear();
			//현재 참조중인 월
			nowMonth = today.getMonth()+1;

			//이번달이면 0, 다음달이면 1 리턴
			monthEquals = thisMonth(nowMonth, realMonth);
			//달력 객체
			var calendarTable = document.getElementById("calendar");
			//달력의 타이틀 객체 획득
			var calendarTableTitle = document.getElementById("calendarTitle");
			//타이틀 수정
			calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";

			//테이블 초기화
			while(calendarTable.rows.length > 2){
				calendarTable.deleteRow(calendarTable.rows.length -1);
			}

			//셀 입력을 위해 테이블 개행
			row = calendarTable.insertRow();

			//달의 첫 날 전까지 빈 셀 생성
			for(i = 0; i < firstDate.getDay(); i++){
				cell = row.insertCell();
				cnt += 1;
			}

			//요일 입력 (셀 생성)
			for(i = 1; i <= lastDate.getDate(); i++){
				//예약하지 못하는 조건일경우 +1씩 되므로, noCount가 0일 시에만 클릭함수를 적용
				noCount = 0;
				cell = row.insertCell();

				//cell에 id 부여
				cell.setAttribute('id', i);
				cell.innerHTML = i;

				//cell.innerHTML = '<label onclick="prevCalendar()">' + i + '</label>';
				cell.align = "center";

				//셀 생성 후 count 증가
				cnt += 1;

				//cnt % 7 == 1이면 일요일이므로 빨갛게
				if (cnt % 7 == 1) {
					cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
				}

				//일주일 입력 완료시 개행
				if (cnt % 7 == 0){
					//cnt % 7 == 0이면 토요일이므로 파랗게
					cell.innerHTML = "<font color=skyblue>" + i + "</font>";
					row = calendar.insertRow();
				}



				//예약불가일 색상변경 (오늘 이전 또는 30일 이후) 및 사용자가 직접 지정한 경우
				etp = exchangeToPosibleDay(cnt)*1;


				if ((nowYear < realYear)) {
					noCount +=1;
				}
				else if ((nowYear == realYear)&&(nowMonth < realMonth) ) {
					noCount +=1;
				}
				else if ((nowYear == realYear)&&(nowMonth == realMonth) && i <= realToDay) {
					noCount +=1;
				}
				else if ((nowYear == realYear)&&(nowMonth > realMonth)&& (i > realToDay) ) {
					noCount +=1;
				}
				else if ((nowYear > realYear)&&(realMonth==12)&&i >= realToDay&&(nowMonth<2)) {
					noCount +=1;
				}
				else if ((nowYear > realYear)&&(realMonth==12)&&(nowMonth>=2)) {
					noCount +=1;
				}
				else if ((nowYear > realYear+1)) {
					noCount +=1;
				}
				else if (possibleDay[etp] == 1){
					noCount +=1;
				}

				if (noCount > 0){
					cell.style.backgroundColor = "#E0E0E0";
					cell.innerHTML = "<font color='#C6C6C6' >" + i + "</font>";
				} else {
					cell.onclick = function()

					{
						selectedTimeAndTotalPriceInit();
						//선택된 날의 연, 월, 일 계산 (일자의 경우 id속성 참조)

						clickedYear = today.getFullYear();
						clickedMonth = (1 + today.getMonth());
						clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;

						clickedDate = this.getAttribute('id');
						clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;

						clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

						//하단에 예약일시 표시
						inputField = document.getElementById("selectedDate");
						inputField.value = clickedYMD;

						//선택된 월, 일 변수 저장
						selectedYear = today.getFullYear();
						selectedMonth = today.getMonth() + 1;
						selectedDate = this.getAttribute('id');

						//선택된 셀 색 변화
						if(selectedCell != null){
							selectedCell.bgColor = "#FFFFFF";
						}
						selectedCell = this;
						this.bgColor = "#fbedaa";

						//time table 생성
						timeTableMaker(today.getMonth() + 1,this.getAttribute('id'));
					}
				}

			}








					//JSON으로 테이블 td 핸들링
					//이번달 0 다음달 1
					nowMonth = today.getMonth()+1;

					//보는 달이 실제 달과 같다면 0
					checkMonth = thisMonth(nowMonth, realMonth);

					var json = [];

					if(checkMonth == 0){
						json = <%=thisMonthResData%>;
					} else {
						json = <%=nextMonthResData%>;
					}

					console.log(json);
					console.log("json 배열 길이:"+json.length);
					//console.log("formattedDate:(out)"+formattedDate);

					// console.log("꽉 찬날 : " + fullDate[i]);
					// cell = document.getElementById(fullDate[i]);
					// console.log("꽉 찬날 : " + cell.innerHTML);
					// cell.style.backgroundColor = "#E0E0E0";
					// cell.style.color = '#C6C6C6';
					// cell.onclick = function(){};



					let halfdays = [];

					halfdays = json.map(item => new Date(item.bookdate).getDate());

					console.log(halfdays);


					for (var i = 0; i < halfdays.length; i++){
						console.log("반 찬날 : " + halfdays[i]);
						cell = document.getElementById(halfdays[i]);
						console.log("반 찬날 : " + cell.innerHTML);
						cell.style.backgroundColor = "#FF0000";
						cell.style.color = '#C6C6C6';
						cell.onclick = function(){
							selectedTimeAndTotalPriceInit();
							//선택된 날의 연, 월, 일 계산 (일자의 경우 id속성 참조)

							clickedYear = today.getFullYear();
							clickedMonth = (1 + today.getMonth());
							clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;

							clickedDate = this.getAttribute('id');
							clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;

							clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

							//하단에 예약일시 표시
							inputField = document.getElementById("selectedDate");
							inputField.value = clickedYMD;

							//선택된 월, 일 변수 저장
							selectedYear = today.getFullYear();
							selectedMonth = today.getMonth() + 1;
							selectedDate = this.getAttribute('id');

							//선택된 셀 색 변화
							if(selectedCell != null){
								selectedCell.bgColor = "#FFFFFF";
							}
							selectedCell = this;
							this.bgColor = "#fbedaa";

							//time table 생성
							timeTableMaker(today.getMonth() + 1,this.getAttribute('id'));
						}




					}











					let result2 = [];  // 결과를 저장할 배열

					for (let i = 0; i < json.length; i++) {
						for (let j = i + 1; j < json.length; j++) {  // 중복 비교를 피하기 위해 j는 i + 1부터 시작
							if (json[i].bookdate === json[j].bookdate) {
								result2.push(json[i]);  // 조건에 맞는 데이터를 결과 배열에 추가
								break;  // 조건에 맞는 첫 번째 데이터를 찾으면 반복을 종료
							}
						}
					}

					console.log(result2);

					let fulldays = [];

					fulldays = result2.map(item => new Date(item.bookdate).getDate());

					console.log(fulldays);


					for (var i = 0; i < fulldays.length; i++){
						console.log("꽉 찬날 : " + fulldays[i]);
						cell = document.getElementById(fulldays[i]);
						console.log("꽉 찬날 : " + cell.innerHTML);
						cell.style.backgroundColor = "#E0E0E0";
						cell.style.color = '#C6C6C6';
						cell.onclick = function(){};

					}







			// //예약이 가득찬 날인 경우 cell 비활성화 및 색상 변경
			// checkMonth = thisMonth(nowMonth, realMonth);
			// fullDate = [];
			// if(checkMonth == 0){
			// 	fullDate = thisMonthFullDateList;
			// }
			// if(checkMonth == 1){
			// 	fullDate = nextMonthFullDateList;
			// }
			// for (var i = 0; i < fullDate.length; i++){
			// 	console.log("꽉 찬날 : " + fullDate[i]);
			// 	cell = document.getElementById(fullDate[i]);
			// 	console.log("꽉 찬날 : " + cell.innerHTML);
			// 	cell.style.backgroundColor = "#E0E0E0";
			// 	cell.style.color = '#C6C6C6';
			// 	cell.onclick = function(){};
			// }




			//달의 마지막날 뒤 행의 빈 공간을 셀로 채우기
			if(cnt % 7 != 0){
				for(i = 0; i < 7 - (cnt % 7); i++){
					cell = row.insertCell();
				}
			}



		}





		//사용자가 입력한 예약불가능 일자와 대조하기 위해 0~7의 환형 계산구조
		function exchangeToPosibleDay(num){
			result = num % 7;
			result -= 1;
			if (result == -1) {
				result = 6;
			}
			return result;
		}


                //이번달이면 0 리턴, 다음달이면 1 리턴
		function thisMonth(todayMonth, dateMonth){
			console.log("todayMonth : " + todayMonth + ", dateMonth : " + dateMonth);
			if (todayMonth*1 == dateMonth*1){
				console.log("이번달 이구요")
				return 0;
			}
			console.log("다음달 이구요")
			return 1;
		}




		// ---------------- time table --------------------------


		function timeTableMaker(selectedMonth, selectedDate){
			row = null
			year = selectedYear;
			month = selectedMonth;
			date = selectedDate;
			let localDate = new Date(selectedYear, selectedMonth-1, selectedDate);
			let formattedDate = localDate.getFullYear() + '-' +
					(localDate.getMonth() + 1).toString().padStart(2, '0') + '-' +
					localDate.getDate().toString().padStart(2, '0');



			console.log(localDate);
			console.log(formattedDate);
			console.log(selectedMonth, selectedDate );
			var timeTable = document.getElementById("timeTable");

			//테이블 초기화
			while(timeTable.rows.length > 0){
				timeTable.deleteRow(timeTable.rows.length-1);
			}



			// 오전/오후 시간대 만들기
			for (i = 0; i < 2; i++) {
				// 오전(0) 또는 오후(1) 설정
				if (i == 0) {
					inputCellText = "오전";
				} else {
					inputCellText = "오후";
				}

				// 셀 생성
				row = timeTable.insertRow();
				cell = row.insertCell();
				cell.setAttribute('id', i);  // id를 0(오전) 또는 1(오후)로 설정
				cell.innerHTML = inputCellText;

				cell.style.borderStyle = 'solid';
				cell.style.borderWidth = '1px';
				cell.style.borderColor = '#C6C6C6';

				var selectedFirstTime = null;
				var cellTime = null;


				// 클릭 이벤트 설정
				cell.onclick = function () {

					// cellTime을 id 속성에서 가져옴
					cellTime = this.getAttribute('id');

					console.log(cellTime);


					cellTime = parseInt(cellTime); // 숫자 형으로 변환






					// 오전/오후 선택 확인
					console.log("최초selectedFirstTime값 설정"+selectedFirstTime);

					if (selectedFirstTime == null) {
						selectedFirstTime = cellTime;  // 첫 선택된 시간에 따라 0(오전) 또는 1(오후) 설정
						console.log(cellTime);
						console.log("selectedFirstTime값 설정"+selectedFirstTime);
					} else {
						if (selectedFirstTime == 0 && cellTime == 1) {
							alert("오전만 선택할 수 있습니다.");
							return false;  // 오전이 이미 선택된 상태에서는 오후를 선택할 수 없습니다.
						} else if (selectedFirstTime == 1 && cellTime == 0) {
							alert("오후만 선택할 수 있습니다.");
							return false;  // 오후가 이미 선택된 상태에서는 오전을 선택할 수 없습니다.
						}
					}
					console.log("최후selectedFirstTime값 설정"+selectedFirstTime);

					// 배경 색 변경
					this.bgColor = "#fbedaa";


					// 하단의 예약일시 표시
					resTime = (selectedFirstTime === 0 ? "오전" : "오후"); // 오전/오후 표시
					resTimeForm = document.getElementById("selectedTime");
					resTimeForm.value = resTime;

					resTimeForm2 = document.getElementById("selectedTime2");
					resTimeForm2.value = selectedFirstTime;

				}
			}








			//JSON으로 테이블 td 핸들링
			//이번달 0 다음달 1
			nowMonth = today.getMonth()+1;

			//보는 달이 실제 달과 같다면 0
			checkMonth = thisMonth(nowMonth, realMonth);

			var json = [];

			if(checkMonth == 0){

				json = <%=thisMonthResData%>;

			} else {

				json = <%=nextMonthResData%>;

			}

			console.log(json);
			console.log("json 배열 길이:"+json.length);
			console.log("formattedDate:(out)"+formattedDate);

			for(i = 0; i < json.length; i++){

				if (formattedDate == json[i].bookdate){
					let jsonObject ;
					jsonObject = json[i];

					console.log("formattedDate:(in)"+formattedDate);

					let startNum = jsonObject.time;  // 0: 오전, 1: 오후

					console.log("Time: " + startNum); //time 값

					// 예약된 시간에 색을 변경하고 선택을 비활성화
					let row = timeTable.rows[startNum];  // time이 0이면 첫 번째 행, 1면 두 번째 행

					if (row) {
						let cell = row.cells[0];
						cell.style.backgroundColor = "#E0E0E0";  // 예약된 셀 색상
						cell.style.color = '#C6C6C6';  // 텍스트 색상
						cell.onclick = function() {};  // 클릭 비활성화
					}
				}
			}


		}



		//시간표 초기화
		function tableinit(){
			timeTableMaker(selectedMonth, selectedDate);
			selectedTimeAndTotalPriceInit();
			buildCalendar();
		}




		//날자 클릭시 예약시간 및 결제정보 초기화
		function selectedTimeAndTotalPriceInit(){
			resDateForm = document.getElementById("selectedDate");
			resDateForm.value = "";

			resTimeForm = document.getElementById("selectedTime");

			resTimeForm.value = "";

			resTimeForm2 = document.getElementById("selectedTime2");

			resTimeForm2.value = "";



		}





		function submitRes(){
			arr = new Array();

			nameForm = document.getElementById("userName");
			phoneForm = document.getElementById("userPhone");
			emailForm = document.getElementById("userEmail");

			resTimeForm = document.getElementById("selectedTime");
			selectedDateFrom = document.getElementById("selectedDate");
			selectedTimeForm = document.getElementById("selectedTime");


			arr.push(nameForm);
			arr.push(phoneForm);
			arr.push(emailForm);
			arr.push(resTimeForm);
			arr.push(selectedDateFrom);
			arr.push(selectedTimeForm);
			arr.push(totalPriceForm);

			for (i = 0; i < arr.length; i++){
				item = arr[i];
				if(item.value == "" ){
					alert("미기입된 정보가 있습니다.");
					item.focus();
					return false;
				}
			}


			popUp = window.open("payment", "payment");
			form = document.paymentForm
			form.action = "payment";
			form.target = "payment";
			form.submit();
		}

	</script>









	<div class="mainBox">
	<div class="contentBox">


		<form action="reservation" method="post" name="reservationform">
			<div class="textLeft"><span style="color: #505050; font-size:40px; font-weight:700">예약하기</span></div>
			<div class="underline"></div>

		<table id="reservation_docinfo" align="center">


			<tr>
				<td class="top"  style="text-align: center">의사 정보</td>
				<td class="top"  style="text-align: center">	과 </td>
<%--		<td class="title" align="left" style="border-top:1px solid #dcdcdc;"> 과 </td>--%>

			</tr>


			<tr>
				<td class="content"><div id="doctorface" ><img src="images/Doctor_image/${detail.savefilename}" />${detail.name}</div></td>

				<td class="content">
				<c:if test="${detail.doctorsection == 1 }">정형외과</c:if>
				<c:if test="${detail.doctorsection == 2 }">이비인후과</c:if>
				<c:if test="${detail.doctorsection == 3 }">외과</c:if>
				<c:if test="${detail.doctorsection == 4 }">산부인과</c:if>
				<c:if test="${detail.doctorsection == 5 }">비뇨기과</c:if>
				</td>

			</tr>


		</table>




		<table id="reservation_user">
				<tr>
<%--					<input type="hidden" name="productName" value=""></input>--%>
<%--					<input type="hidden" name="placeNo" value=""></input>--%>
<%--					--%>

					<td class="top">예약자 정보</td>
				</tr>

				<tr>
					<td class="top" style="text-align: center">예약자</td>
					<td class="top" style="text-align: center">전화번호</td>

				</tr>
				<tr>
					<td class="content"> ${mvo.name} </td>
					<td class="content"> ${mvo.phone} </td>
				</tr>

		</table>





		<table id="reservation_time">
			<tr>
				<td class="top" align="left" colspan="2" style="text-align: center"><span>시간선택</span>&nbsp;&nbsp;&nbsp;&nbsp;<span><button class="btnTime" type="button" id="btn_init" onclick="tableinit()">시간초기화</button></span></td>



<%--				<td class="top" align="center"><button class="btnTime" type="button" onclick="tableinit()">초기화</button></td>--%>

<%--				<td class="top" align="right"><button class="btnTime" type="button" onclick="tableinit()">초기화</button></td>--%>
				<td class="top" colspan="2" style="text-align: center">예약일시</td>
			</tr>

			<tr>
				<td style="border:1px">
					<table id="calendar">

						<tr>
							<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
							<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
							<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
						</tr>
						<tr>
							<td align="center"><font color ="#F79DC2">일</td>
							<td align="center">월</td>
							<td align="center">화</td>
							<td align="center">수</td>
							<td align="center">목</td>
							<td align="center">금</td>
							<td align="center"><font color ="skyblue">토</td>
						</tr>

					</table>
				</td>

				<td>
					<table id = "timeTable">	</table>

				</td>


				<td class="content" style="display: flex; flex-direction: column; justify-content: center; align-items: center; height: 100%;">


					<table id = "reservationselected"  style="border:1px;text-align: center; width: 100%;">

						<tr style="text-align: center">
							<td class="title" style="border:1px">
								선택날짜
							</td>
							<td class="title" style="border:1px">
								선택 시간
							</td>

						</tr>

						<tr style="text-align: center">

							<td class="content" style="text-align: center; border:1px">
								<div>
								<input id="selectedDate" style="border:none; width:150px"  name="selectedDate" value="" readonly="readonly" ></input>
								</div>

							</td>
							<td class="content" style="text-align: center">
								<div>
								<input id="selectedTime" style="border:none; width:150px"  name="selectedTime" value="" readonly="readonly"></input>

								<input id="selectedTime2" type="hidden" style="border:none"  name="selectedTime2" value="" readonly="readonly"></input>
								</div>

							</td>


						</tr>




					</table>

					<input type="hidden" name="mseq" value="${mvo.mseq}"></input>
					<input type="hidden" name="dseq" value="${dseq}"></input>
					<input type="submit" value="예약" id="btn_submit">





                                <%--					<input type="text" style="border:none; width:150px" value="선택 날짜"	readonly="readonly"></input>--%>
<%--					<input id="selectedDate" style="border:none; width:150px"  name="selectedDate" value="" readonly="readonly" ></input>--%>

<%--					<input type="text" style="border:none; width:150px" value="선택 시간"	readonly="readonly"></input>--%>
<%--					<input id="selectedTime" style="border:none; width:150px"  name="selectedTime" value="" readonly="readonly"></input>--%>

<%--					<input id="selectedTime2" type="hidden" style="border:none"  name="selectedTime2" value="" readonly="readonly"></input>--%>






				</td>

<%--				<td class="content" colspan="2" align="right">--%>

<%--				</td>--%>
			</tr>
			<tr>
				<td>
				<div><span style="color:#ff0000">빨간색<span> : 오전/오후중 하나가 이미 예약된날</div><br>
				<div>회색 : 오전/오후가 모두 예약된날 혹은 휴무</div>
				</td>
			</tr>





		</table>
		</form>
	</div>
	</div>

<script type="text/javascript">buildCalendar();</script>








</main>



<%@ include file="../footer.jsp" %>
