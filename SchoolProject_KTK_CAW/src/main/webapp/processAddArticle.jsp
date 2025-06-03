<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Article"%>
<%@ page import="dao.ArticleRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 작성한 게시글 가져오기
	String title=request.getParameter("title");
	String description= request.getParameter("description");
	String articleId=request.getParameter("articleId");

	
	//새 객체 만들기
	ArticleRepository dao=ArticleRepository.getInstance();
	
	Article newArticle=new Article();
	newArticle.setTitle(title);
	newArticle.setArticleId(articleId);
	newArticle.setDescription(description);
	
	dao.addArticle(newArticle);
	
	// 페이지 돌려보내기
	response.sendRedirect("articles.jsp");
	
%>