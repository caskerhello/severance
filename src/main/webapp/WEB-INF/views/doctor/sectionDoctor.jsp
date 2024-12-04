
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body>

<div class="sub_page" >
    <article  style="flex-direction:column">
        <h2>${doctorsection}</h2>
        <div class="sectionDoctor">

            <c:forEach items="${dvo}"  var="dvo">


                <div>이름 : ${dvo.name}</div>
                <div>의사번호 : ${dvo.dseq}</div>
                <div></div>

                <div class="sectionitem"
                     onClick="location.href='doctorDetail?dseq=${dvo.dseq}'" >

                    <img src="images/${dvo.savefilename}" />


                </div>


            </c:forEach>
        </div>
    </article>
</div>


</body>
</html>
