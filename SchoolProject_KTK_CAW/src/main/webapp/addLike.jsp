<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>


<%
	//클라이언트로부터 전달된 파라미터 'id'를 가져온다
	String id = request.getParameter("id");
	
	//id가 없거나 공백이라면, 게시글 목록 페이지로 리다이렉트
	if (id == null || id.trim().equals("")) {
	 response.sendRedirect("articles.jsp");
	 return;
	}
	
	//ArticleRepository의 인스턴스를 가져온다 (싱글턴 패턴)
	ArticleRepository dao = ArticleRepository.getInstance();
	
	//해당 id에 해당하는 게시글을 DB 또는 메모리에서 조회
	Article article = dao.getArticleById(id);
	
	//게시글이 존재하지 않는 경우 예외 처리 페이지로 리다이렉트
	if (article == null) {
	 response.sendRedirect("exceptionNoArticleId.jsp");
	 return;
	}
	
	//전체 게시글 목록을 가져온다 (좋아요 대상 찾기 위함)
	ArrayList<Article> goodsList = dao.getAllArticles();
	Article goods = new Article();
	
	//id에 해당하는 Article 객체(goods)를 goodsList에서 찾는다
	for (int i = 0; i < goodsList.size(); i++) {
	 goods = goodsList.get(i);
	 if (goods.getArticleId().equals(id)) {
	     break;
	 }
	}
	
	//사용자의 세션에서 좋아요 리스트(likelist)를 가져옴
	ArrayList<Article> list = (ArrayList<Article>) session.getAttribute("likelist");
	
	//likelist가 세션에 없다면 새로 생성하고 세션에 저장
	if (list == null) {
	 list = new ArrayList<Article>();
	 session.setAttribute("likelist", list);
	}
	
	//list에 이미 좋아요한 게시글이 있는지 확인하고 수량을 증가
	int cnt = 0;
	Article goodsQnt = new Article();
	for (int i = 0; i < list.size(); i++) {
	 goodsQnt = list.get(i);
	 if (goodsQnt.getArticleId().equals(id)) {
	     cnt++;
	     int likeQuntity = goodsQnt.getLike_article_quantity() + 1;
	     goodsQnt.setLike_article_quantity(likeQuntity);
	 }
	}
	
	//list에 해당 id 게시글이 없었다면 새로 추가하고 좋아요 수를 1로 설정
	if (cnt == 0) {
	 goods.setLike_article_quantity(1);
	 list.add(goods);
	}
	
	//다시 해당 게시글 상세 페이지로 이동
	response.sendRedirect("userPage.jsp");

%>