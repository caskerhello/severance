function admincancelreservation(rseq) {
    var ans = confirm("예약을 취소하시겠습니까??");
    if (ans) {
        location.href = "admincancelreservation?rseq=" + rseq;
    }
}


function update_docimage() {
    console.log("clicked");
    var formselect = $('#fileupForm')[0];   // 지목된 폼을 변수에 저장
    var formData = new FormData(formselect);
    $.ajax(
        {
            url: "/fileup",
            type: "POST",
            enctype: "multipart/form-data",
            data: formData,
            timeout: 10000,
            contentType: false,
            processData: false,

            success: function (data) {
                $('#filename').html("<div>" + data.image + "</div>");
                $("#filename").append("<img src='doctor_images/" + data.savefilename + "' height='150'/>");
                $('#image').val(data.image);
                $('#savefilename').val(data.savefilename);
            },
            error: function () {
                alert("실패");
            },
        }
    );
}


function update_logimage() {
    console.log("clicked2");
    var formselect = $('#fileupForm2')[0];   // 지목된 폼을 변수에 저장
    var formData = new FormData(formselect);
    $.ajax(
        {
            url: "/fileup",
            type: "POST",
            enctype: "multipart/form-data",
            data: formData,
            timeout: 10000,
            contentType: false,
            processData: false,

            success: function (data) {

                console.log(data.image);
                console.log(data.savefilename);

                $('#filename2').html("<div>" + data.image + "</div>");
                $("#filename2").append("<img src='doctor_images/" + data.savefilename + "' height='150'/>");

                $('#image2').val(data.image);
                $('#savefilename2').val(data.savefilename);
            },
            error: function () {
                alert("실패");
            },
        }
    );
}


function update_doc() {


    console.log(parseInt(document.getElementById('admindoctorupdatedseq').value, 10));

    var dto = {
        dseq: parseInt(document.getElementById('admindoctorupdatedseq').textContent, 10),
        name: document.getElementById('admindoctorupdatename').value,
        doctorsection: parseInt(document.getElementById('admindoctorupdatedoctorsection').value, 10),
        content: document.getElementById('admindoctorupdatecontent').value,
        image: document.getElementById('image').value,
        savefilename: document.getElementById('savefilename').value,
        daylimit: document.getElementById('admindoctorupdatedaylimit').value,
        bachd: document.getElementById('admindoctorupdatebachd').value,
        mastd: document.getElementById('admindoctorupdatemastd').value,
        doctd: document.getElementById('admindoctorupdatedoctd').value,
        resume: document.getElementById('admindoctorupdateresume').value,
        univlogo: document.getElementById('image2').value,
        univlogofilename: document.getElementById('savefilename2').value
    };


    // JSON으로 직렬화
    var jsonData = JSON.stringify(dto);

// AJAX 요청으로 서버로 전송
    $.ajax({
        url: '/adminDoctorUpdate',  // 서버 URL
        type: 'POST',
        contentType: 'application/json',
        data: jsonData,     // DTO 객체를 JSON으로 변환하여 전송
        success: function () {
            console.log('서버 응답');

            alert("업데이트 완료!");
            location.reload()

        },
        error: function (xhr, status, error) {
            console.error('서버 오류:', error);
        }
    });

};


function adminDoctorDelete(dseq, page) {
    var ans = confirm("의사 정보를 삭제하시겠습니까??");
    if (ans) {
        location.href = "adminDoctorDelete?dseq=" + dseq;
        alert("삭제 완료!");
        location.reload()
    }

}










function adminDoctorUpdateForm(dseq,page) {
    console.log(page)





    $.ajax({
        url: "adminDoctorUpdateForm",
        type: "POST",

        data: {dseq:dseq},
        dataType : "JSON",
        progress: true
    })
        .done(function(data) {
            var result = new Array;
            result = data.doctor;



            console.log(result.savefilename);

            var content = "";

            content += '<tr>';


            content += '<td id="admindoctorupdatedseq">' + result.dseq + '</td>';
            // content +=    '<td>' + result.name + '</td>';
            // content +=    '<td>' + result.doctorsection + '</td>';
            content += '<td colspan="3">' + result.content + '</td>';
            // content +=    '<td>' +  result.bachd  +'</td>';
            // content +=    '<td>' +  result.mastd  +'</td>';
            // content +=    '<td>' +  result.doctd  +'</td>';
            // content +=    '<td>' +  result.resume  +'</td>';
            content += '<td>' + result.univlogo + '</td>';

            content += '</tr>';


            content += '<tr>';


            // content +=    '<td>' + result.dseq + '</td>';
            // content +=    '<td>' + result.name + '</td>';
            // content +=    '<td>' + result.doctorsection + '</td>';
            // content +=    '<td colspan="3">' + result.content + '</td>';
            content += '<td>' + '약력' + '</td>';
            content += '<td>' + '[학부]' + result.bachd + '<br>' + '[석사]' + result.mastd + '</td>';

            content += '<td>' + '[박사]' + result.doctd + '<br>' + '[경력]' + result.resume + '</td>';

            // content +=    '<td>' +  result.univlogo  +'</td>';

            content += '</tr>';

            content += '<tr>';


            content += '<td>' + result.name + '</td>';
            content += '<td><input type="text" id="admindoctorupdatename" placeholder="이름"/></td>';
            content += '<td><input type="text" id="admindoctorupdatedoctorsection" placeholder="진료과"/></td>';

            content += '<td><input type="text" id="admindoctorupdatedaylimit" placeholder="출근일"/></td>';

            content += '</tr>';

            content += '<tr>';
            content += '<td colspan="5"><textarea id="admindoctorupdatecontent" placeholder="과 설명" rows="4" cols="200"/></td>';
            content += '</tr>';


            content += '<tr>';


            content += '<td>' + '약력' + '</td>';

            content += '<td colspan="4"><input type="text" style="width: 300px;" id="admindoctorupdatebachd" placeholder="학부"/><input type="text" style="width: 300px;" id="admindoctorupdatemastd" placeholder="석사"/><input type="text" style="width: 300px;" id="admindoctorupdatedoctd" placeholder="박사"/><input type="text" style="width: 300px;" id="admindoctorupdateresume" placeholder="이력"/></td>';

            // content +=    '<td>' +  result.univlogo  +'</td>';

            content += '</tr>';


            content += '<td>' + '사진/로고' + '</td>';

            content += '<td>' +
                '<div class="field" >' +

                '<label>의사사진</label>' +
                '<div>' +
                '<input type="hidden" name="image"  id="image" value="'+result.image+'"/>' +
                '<input type="hidden" name="savefilename" id="savefilename" value="'+result.savefilename+'" >' +

                '<div id="filename">' +
                result.image +
                '<img src="doctor_images/'+result.savefilename+'" width="50" />'+
                '</div>'+
                '</div>'+
                '</div>'+

                '<div>'+
                '<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">' +
                '<input type="file" name="fileimage"/>' +
                '<input type="button" id="imageAddBtn" value="추가" onclick="update_docimage()" />' +
                '</form>' +
                '</div></td>;'





            content += '<td>' +
                '<div class="field" >' +

                '<label>로고</label>' +
                '<div>' +
                '<input type="hidden" name="image2"  id="image2" value="'+result.univlogo+'"/>' +
                '<input type="hidden" name="savefilename2" id="savefilename2" value="'+result.univlogofilename+'" >' +

                '<div id="filename2">' +
                result.univlogo +
                '<img src="/doctor_images/'+result.univlogofilename+'" width="50" />'+
                '</div>'+
                '</div>'+
                '</div>'+

                '<div>'+
                '<form name="fromm" id="fileupForm2" method="post" enctype="multipart/form-data">' +
                '<input type="file" name="fileimage"/>' +
                '<input type="button" id="imageAddBtn" value="추가" onclick="update_logimage()" />' +
                '</form>' +
                '</div></td>;'


            content += '<td>' + '<input type="button" id="DoctorAddBtn" onclick="update_doc()" value="정보수정"/>' + '</td>';

            content += '</tr>';


            $(".listData2").html(content);


        })
        .fail(function (e) {
            alert("검색에 실패하였습니다.");
            console.log("AJAX Error:", status, error);
            console.log("Response:", xhr.responseText);
        })
        .fail(function(e) {
            console.log("AJAX 요청 실패:", e);
        })
        .always(function() {

        });

    if (adminmodal) {
        // adminmodal이 존재하면 실행
        adminmodal.style.display = 'block';
    } else {
        console.log('adminmodal 요소를 찾을 수 없습니다.');
    }
}








function adminDoctorInsertForm() {


    var content = "";


    content += '<tr>';


    content += '<td>' + '정보입력' + '</td>';
    content += '<td><input type="text" id="admindoctorinsertname" placeholder="이름"/></td>';
    content += '<td><input type="text" id="admindoctorinsertdoctorsection" placeholder="진료과"/></td>';

    content += '<td><input type="text" id="admindoctorinsertdaylimit" placeholder="출근일"/></td>';

    content += '</tr>';

    content += '<tr>';
    content += '<td colspan="5"><textarea id="admindoctorinsertcontent" placeholder="과 설명" rows="4" cols="200"/></td>';
    content += '</tr>';


    content += '<tr>';


    content += '<td>' + '정보입력' + '</td>';

    content += '<td colspan="4"><input type="text" style="width: 300px;" id="admindoctorinsertbachd" placeholder="학부"/><input type="text" style="width: 300px;" id="admindoctorinsertmastd" placeholder="석사"/><input type="text" style="width: 300px;" id="admindoctorinsertdoctd" placeholder="박사"/><input type="text" style="width: 300px;" id="admindoctorinsertresume" placeholder="이력"/></td>';

    // content +=    '<td>' +  result.univlogo  +'</td>';

    content += '</tr>';


    content += '<td>' + '사진/로고' + '</td>';

    content += '<td>' +
        '<div class="field" >' +

        '<label>의사사진</label>' +
        '<div>' +
        '<input type="hidden" name="image"  id="image" value=""/>' +
        '<input type="hidden" name="savefilename" id="savefilename" value="" >' +

        '<div id="filename">' +

        '</div>' +
        '</div>' +
        '</div>' +

        '<div>' +
        '<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">' +
        '<input type="file" name="fileimage"/>' +
        '<input type="button" id="imageAddBtn" value="추가" onclick="update_docimage()" />' +
        '</form>' +
        '</div></td>;'


    content += '<td>' +
        '<div class="field" >' +

        '<label>로고</label>' +
        '<div>' +
        '<input type="hidden" name="image2"  id="image2" value=""/>' +
        '<input type="hidden" name="savefilename2" id="savefilename2" value="" >' +

        '<div id="filename2">' +

        '</div>' +
        '</div>' +
        '</div>' +

        '<div>' +
        '<form name="fromm" id="fileupForm2" method="post" enctype="multipart/form-data">' +
        '<input type="file" name="fileimage"/>' +
        '<input type="button" id="imageAddBtn" value="추가" onclick="update_logimage()" />' +
        '</form>' +
        '</div></td>;'


    content += '<td>' + '<input type="button" id="DoctorAddBtn" onclick="insert_doc()" value="정보입력"/>' + '</td>';

    content += '</tr>';


    $(".listData2").html(content);

    if (adminmodal) {
        // adminmodal이 존재하면 실행
        adminmodal.style.display = 'block';
    } else {
        console.log('adminmodal 요소를 찾을 수 없습니다.');
    }


}


function insert_doc() {

    console.log("정보입력");


    var dto = {

        name: document.getElementById('admindoctorinsertname').value,
        doctorsection: parseInt(document.getElementById('admindoctorinsertdoctorsection').value, 10),
        content: document.getElementById('admindoctorinsertcontent').value,
        image: document.getElementById('image').value,
        savefilename: document.getElementById('savefilename').value,
        daylimit: document.getElementById('admindoctorinsertdaylimit').value,
        bachd: document.getElementById('admindoctorinsertbachd').value,
        mastd: document.getElementById('admindoctorinsertmastd').value,
        doctd: document.getElementById('admindoctorinsertdoctd').value,
        resume: document.getElementById('admindoctorinsertresume').value,
        univlogo: document.getElementById('image2').value,
        univlogofilename: document.getElementById('savefilename2').value
    };


    // JSON으로 직렬화
    var jsonData = JSON.stringify(dto);

// AJAX 요청으로 서버로 전송
    $.ajax({
        url: '/adminDoctorInsert',  // 서버 URL
        type: 'POST',
        contentType: 'application/json',
        data: jsonData,     // DTO 객체를 JSON으로 변환하여 전송
        success: function () {
            console.log('서버 응답');

            alert("입력 완료!");
            location.reload()

        },
        error: function (xhr, status, error) {
            console.error('서버 오류:', error);
        }
    });

}


function updatePlaceholder() {
    var select = document.getElementById('searchCategory');
    var input = document.getElementById('key');
    var selectedValue = select.value;

    // value 값에 따라 placeholder를 다르게 설정
    if (selectedValue === 'adminDoctorList') {
        input.placeholder = '의사 성명검색';
    } else if (selectedValue === 'adminReservationList') {
        input.placeholder = '예약 날짜검색';
    } else if (selectedValue === 'adminMemberList') {
        input.placeholder = '회원 이름 검색';
    } else if (selectedValue === 'adminQnaList') {
        input.placeholder = 'QnA 제목 검색';
    }
}









