/*qna.js */

function qnaView( qseq ){
    location.href="qnaView?qseq="+ qseq ;
}

// QnA 글 작성시 제목, 질문내용 글자수 제한 및 질문내용 글자수 세기
function counter() {
    var qsubject = document.getElementById('subjectQ').value;
    var question = document.getElementById('contentQ').value;

    var qsubjectLength = qsubject.length;
    // 개행 문자(enter키 사용) 포함한 정확한 글자 수 계산
    var questionLength = question.split('\n').join('\r\n').length;

    // 글자 수 제한 처리
    if(qsubjectLength > 300){
        alert("제목은 최대 300자까지 입력 가능합니다.");
    }

    if (questionLength > 3000) {
        alert("질문 내용은 최대 3000자까지 입력 가능합니다.");

        // 개행 문자 포함 3000자에 맞게 잘라내기
        var truncated = question.split('\n').reduce((acc, line) => {
            var lineLength = line.length + 2; // 개행 문자 포함한 줄 길이
            if (acc.total + lineLength <= 3000) {
                acc.result.push(line);
                acc.total += lineLength;
            } else if (acc.total < 3000) {
                // 자를 수 있는 만큼만 추가
                var remaining = 3000 - acc.total - 1; // 남은 공간
                acc.result.push(line.substring(0, remaining));
                acc.total = 3000;
            }
            return acc;
        }, { result: [], total: 0 }).result.join('\n');

        document.getElementById('contentQ').value = truncated;
        questionLength = truncated.split('\n').join('\r\n').length; // 다시 계산
    }

    // 글자 수 업데이트
    document.getElementById('textCount').innerHTML = '(' + questionLength + '/3000)';
}
