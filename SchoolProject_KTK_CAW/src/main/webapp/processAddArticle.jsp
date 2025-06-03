<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Article"%>
<%@ page import="dao.ArticleRepository"%>
<%@ page import="java.util.*" %>
<!-- 이미지 업로드를 위한 import -->
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	// 이미지파일
	String filename="";
	String realFolder="C:\\Users\\awon0\\Desktop\\sec_project\\sec_project\\JSP_UNIV_Project\\SchoolProject_KTK_CAW\\src\\main\\webapp\\resources\\images";
	int maxSize=5*1024*1024;//최대파일 업로드 크기 5MB
	String encType="utf-8";
	
	// 새 객체 만들기
	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType, new DefaultFileRenamePolicy());
	
	String title=multi.getParameter("title");
	String articleId=multi.getParameter("articleId");
	String description=multi.getParameter("description");
	
	Enumeration files= multi.getFileNames();
	String fname=(String)files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	
	//새 객체 만들기
	ArticleRepository dao=ArticleRepository.getInstance();
	
	Article newArticle=new Article();
	newArticle.setTitle(title);
	newArticle.setArticleId(articleId);
	newArticle.setDescription(description);
	newArticle.setFilename(fileName);
	
	dao.addArticle(newArticle);
	
	// 페이지 돌려보내기
	response.sendRedirect("articles.jsp");
	
%>