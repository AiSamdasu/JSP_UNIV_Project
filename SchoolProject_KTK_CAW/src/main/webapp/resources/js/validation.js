function CheckAddArticle(){
	var title = document.getElementById("title");
	var description = document.getElementById("description");
	var image = document.getElementById("ArticleImage");

	// 제목 체크
	if(title.value.length < 1 || title.value.length > 20){
		alert("[제목]\n최소 1자에서 20자까지 입력하세요");
		title.focus();
		return false;
	}
	
	// 본문 체크
	if(description.value.length < 1){
		alert("[본문]\n본문 내용을 입력해주세요");
		description.focus();
		return false;
	}

	// 이미지 체크
	if(!image.value){
		alert("[이미지]\n이미지를 반드시 첨부해주세요");
		image.focus();
		return false;
	}

	document.newArticle.submit();
}
