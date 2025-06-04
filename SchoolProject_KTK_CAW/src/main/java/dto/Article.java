package dto;

import java.io.Serializable;
// 게시글 클래스
public class Article implements Serializable {


	private static final long serialVersionUID = 1L;
	
	private String title;// 제목
	private String user;// 작성자
	private String description;// 설명
	private String articleId; //아이디
	private String filename; // 이미지 파일
	private int like; //좋아요 갯수
	private int like_article_quantity; // 좋아요 누른 게시글
	

	public Article() {
		super();
	}
	
	public Article(String title,String user) {
		this.title=title;
		this.user=user;
		
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getLike_article_quantity() {
		return like_article_quantity;
	}

	public void setLike_article_quantity(int like_article_quantity) {
		this.like_article_quantity = like_article_quantity;
	}



	

}
