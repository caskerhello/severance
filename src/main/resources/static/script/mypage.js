function cancelreservation(rseq){
    var ans = confirm("예약을 취소하시겠습니까??");
    if( ans ){
        location.href="cancelreservation?rseq="+rseq;
    }
}