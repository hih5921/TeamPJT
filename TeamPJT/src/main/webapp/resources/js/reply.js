$(document).ready(function () {

    var formObj = $("form[role='form']");
    

    $(".modBtn").on("click", function () {
        formObj.attr("action", "${path}/article/paging/search/modify");
        formObj.attr("method", "get");
        formObj.submit();
    });

    $(".delBtn").on("click", function () {
        formObj.attr("action", "${path}/article/paging/search/remove");
        formObj.submit();
    });

    $(".listBtn").on("click", function () {
        formObj.attr("action", "${path}/article/paging/search/list");
        formObj.attr("method", "get");
        formObj.submit();
    });
    
    var article_no = "${article.article_no}";  // 현재 게시글 번호
    var replyPageNum = 1; // 댓글 페이지 번호 초기화

    // 댓글 내용 : 줄바꿈/공백처리
    Handlebars.registerHelper("escape", function (reply_text) {
        var text = Handlebars.Utils.escapeExpression(reply_text);
        text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
        text = text.replace(/( )/gm, "&nbsp;");
        return new Handlebars.SafeString(text);
    });

    // 댓글 등록일자 : 날짜/시간 2자리로 맞추기
    Handlebars.registerHelper("prettifyDate", function (timeValue) {
        var dateObj = new Date(timeValue);
        var year = dateObj.getFullYear();
        var month = dateObj.getMonth() + 1;
        var date = dateObj.getDate();
        var hours = dateObj.getHours();
        var minutes = dateObj.getMinutes();
        // 2자리 숫자로 변환
        month < 10 ? month = '0' + month : month;
        date < 10 ? date = '0' + date : date;
        hours < 10 ? hours = '0' + hours : hours;
        minutes < 10 ? minutes = '0' + minutes : minutes;
        return year + "-" + month + "-" + date ;
    });

    // 댓글 목록 함수 호출
    getReplies("${path}/replies/"+ article_no+"/"+replyPageNum);

    // 댓글 목록 함수
    function getReplies(repliesUri) {
        $.getJSON(repliesUri, function (data) {
            printReplyCount(data.pageMaker.totalCount);
            printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
            printReplyPaging(data.pageMaker, $(".pagination"));
        });
    }

    // 댓글 갯수 출력 함수
    function printReplyCount(totalCount) {

        var replyCount = $(".replyCount");
        var collapsedBox = $(".collapsed-box");

        // 댓글이 없으면
        if (totalCount === 0) {
            replyCount.html(" 댓글이 없습니다. 의견을 남겨주세요");
            collapsedBox.find(".btn-box-tool").remove();
            return;
        }

        // 댓글이 존재하면
        replyCount.html(" 댓글목록 (" + totalCount + ")");
        collapsedBox.find(".box-tools").html(
            "<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
            + "<i class='fa fa-plus'></i>"
            + "</button>"
        );

    }

    // 댓글 목록 출력 함수
    function printReplies(replyArr, targetArea, templateObj) {
        var replyTemplate = Handlebars.compile(templateObj.html());
        var html = replyTemplate(replyArr);
        $(".replyDiv").remove();
        targetArea.html(html);
    }

    // 댓글 페이징 출력 함수
    function printReplyPaging(pageMaker, targetArea) {
    	var str = "";

	    // 이전 버튼 활성화
	    if (pageMaker.prev) {
	        str += "<li class=\"page-item\"><a class=\"page-link\" href='"+(pageMaker.startPage-1)+"'>이전</a></li>";
	    }

	    // 페이지 번호
	    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
	        var strCalss = pageMaker.criteria.page == i ? 'class=active' : '';
	        str += "<li class=\"page-item\" "+strCalss+"><a class=\"page-link\" href='"+i+"'>"+i+"</a></li>";
	    }

	    // 다음 버튼 활성화
	    if (pageMaker.next) {
	        str += "<li class=\"page-item\"><a class=\"page-link\" href='"+(pageMaker.endPage + 1)+"'>다음</a></li>";
	    }
        targetArea.html(str);
    }

    // 댓글 페이지 번호 클릭 이벤트
    $(".pagination").on("click", "li a", function (event) {
        event.preventDefault();
        replyPageNum = $(this).attr("href");
        getReplies("${path}/replies/" + article_no + "/" + replyPageNum);
    });
	
 	// 댓글 저장 버튼 클릭 이벤트
    $(".replyAddBtn").on("click", function () {

        // 입력 form 선택자
        var reply_writerObj = $("#newReplyWriter");
        var reply_textObj = $("#newReplyText");
        var reply_writer = reply_writerObj.val();
        var reply_text = reply_textObj.val();

        // 댓글 입력처리 수행
        $.ajax({
            type : "post",
            url : "${path}/replies/",
            headers : {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
                article_no : article_no,
                reply_writer : reply_writer,
                reply_text : reply_text
            }),
            success: function (result) {
                console.log("result : " + result);
                if (result === "regSuccess") {
                    alert("댓글이 등록되었습니다.");
                    replyPageNum = 1;  // 페이지 1로 초기화
                    getReplies("${path}/replies/" + article_no + "/" + replyPageNum); // 댓글 목록 호출
                    reply_textObj.val("");   // 댓글 입력창 공백처리
                    reply_writerObj.val("");   // 댓글 입력창 공백처리
                }
            }
        });
    });
 	
 	// 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅
    $(".repliesDiv").on("click", ".replyDiv", function (event) {
        var reply = $(this);
        $(".reply_no").val(reply.attr("data-reply_no"));
        $("#reply_text").val(reply.find(".oldReplyText").text());
    });

    // modal 창의 댓글 수정버튼 클릭 이벤트
    $(".modalModBtn").on("click", function () {
        var reply_no = $(".reply_no").val();
        var reply_text = $("#reply_text").val();
        $.ajax({
            type : "put",
            url : "${path}/replies/" + reply_no,
            headers : {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "PUT"
            },
            dataType : "text",
            data: JSON.stringify({
            	reply_text : reply_text
            }),
            success: function (result) {
                console.log("result : " + result);
                if (result === "modSuccess") {
                    alert("댓글이 수정되었습니다.");
                    getReplies("${path}/replies/" + article_no + "/" + replyPageNum); // 댓글 목록 호출
                    $("#modModal").modal("hide"); // modal 창 닫기
                }
            }
        })
    });

    // modal 창의 댓글 삭제버튼 클릭 이벤트
    $(".modalDelBtn").on("click", function () {
        var reply_no = $(".reply_no").val();
        $.ajax({
            type: "delete",
            url: "${path}/replies/" + reply_no,
            headers: {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "DELETE"
            },
            dataType: "text",
            success: function (result) {
                console.log("result : " + result);
                if (result === "delSuccess") {
                    alert("댓글이 삭제되었습니다.");
                    getReplies("${path}/replies/" + article_no + "/" + replyPageNum); // 댓글 목록 호출
                    $("#delModal").modal("hide"); // modal 창 닫기
                }
            }
        });
    });
});
