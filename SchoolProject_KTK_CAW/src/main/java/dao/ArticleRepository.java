package dao;
// 게시글 데이터 접근 클래스
import java.util.ArrayList;
import dto.Article;

public class ArticleRepository {

	private ArrayList<Article> listOfArticles= new ArrayList<Article>();
	
	//자바 빈즈로 사용할 게시글 데이터 접근 클래스
	public ArticleRepository() {
		Article article1=new Article("제목1","작성자");
		article1.setDescription("이것은 본문의 내용입니다.");
		article1.setArticleId("1");
		Article article2=new Article("제목2","작성자");
		article2.setDescription("이것은 본문의 내용입니다.");
		article2.setArticleId("2");
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
}
