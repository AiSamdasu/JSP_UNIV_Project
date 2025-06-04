<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>  
 <!-- 개별 게시글 삭제 페이지 -->
<% 
	String id=request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("articles.jsp");
		return;
	}
	
	ArticleRepository dao=ArticleRepository.getInstance();
	
	Article article=dao.getArticleById(id);
	if(article==null){
		response.sendRedirect("exceptionNoArticleId.jsp");
	}
	
	
	ArrayList<Article> likelist=(ArrayList<Article>)session.getAttribute("likelist");
	Article goodsQnt=new Article();
	for(int i=0;i<likelist.size();i++){
		goodsQnt=likelist.get(i);
		if(goodsQnt.getArticleId().equals(id)){
			likelist.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("userPage.jsp");

%>