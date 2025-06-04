package dao;
// 게시글 데이터 접근 클래스
import java.util.ArrayList;
import dto.Article;

public class ArticleRepository {

	private ArrayList<Article> listOfArticles= new ArrayList<Article>();
	// addArticle
	private static ArticleRepository instance= new ArticleRepository();
	
	
	public static ArticleRepository getInstance() {
		return instance;
	}
	
	//자바 빈즈로 사용할 게시글 데이터 접근 클래스
	public ArticleRepository() {
		Article article1=new Article("토마토 파스타","파스타장인");
		article1.setDescription("집에서도 고급스러운 파스타 만들기!");
		article1.setArticleId("1");
		article1.setFilename("1.jpg");
		Article article2=new Article("제목2","작성자");
		article2.setDescription("이것은 본문의 내용입니다.");
		article2.setArticleId("2");
		article2.setFilename("2.jpg");
		// 리스트에 추가
		listOfArticles.add(article1);
		listOfArticles.add(article2);
	}
	// 게시글 목록을 가져오는 메소드 
	public ArrayList<Article> getAllArticles(){
		return listOfArticles;
	}

	
	// 게시글 상세 정보 가져오기
	public Article getArticleById(String articleId) {
		Article articleById = null;
		
		for(int i=0;i<listOfArticles.size();i++) {
			Article article= listOfArticles.get(i);
			if(article!=null&&article.getArticleId()!=null&&article.getArticleId().equals(articleId)) {
				articleById=article;
				break;
			}
		}
		return articleById;
	}
	
	// addArticle
	public void addArticle(Article article) {
		listOfArticles.add(article);
	}
}
