package dao;
import java.util.ArrayList;
import dto.PointProduct;

public class pointProductRepository {
	private static pointProductRepository instance = new pointProductRepository();
	
	public static pointProductRepository getInstance() {
		return instance;
	}
	
	private ArrayList<PointProduct> productList = new ArrayList<PointProduct>();
	public pointProductRepository() {
		PointProduct PointProduct1 = new PointProduct("빙그레 바나나 우유", "C123400");
		PointProduct1.setProductPrice(2000);
		PointProduct1.setProductImage("NULL");
		PointProduct1.setRemainingQuantity(3);
		PointProduct1.setDescription("문화유산급 바나나 우유");
		
		PointProduct PointProduct2 = new PointProduct("에어팟 프로 3", "P445388");
		PointProduct2.setProductPrice(310000);
		PointProduct2.setProductImage("NULL");
		PointProduct2.setRemainingQuantity(4);
		PointProduct2.setDescription("노이즈 캔슬링 기능이 있는 에어팟 프로 3");
		
		PointProduct PointProduct3 = new PointProduct("겔럭시 워치 7", "P111255");
		PointProduct3.setProductPrice(230000);
		PointProduct3.setProductImage("NULL");
		PointProduct3.setRemainingQuantity(2);
		PointProduct3.setDescription("삼성 겔럭시 워치 7");
		
		productList.add(PointProduct1);
		productList.add(PointProduct2);
		productList.add(PointProduct3);
		
	}
	
	public ArrayList<PointProduct> getAllProducts(){
		return productList;
	}
	
	public PointProduct getPointProductById(String ProductCode) {
		PointProduct PointProductById = null;
		
		for (int i = 0; i < productList.size(); i++) {
			PointProduct pointProduct = productList.get(i);
			if (pointProduct != null && pointProduct.getProductCode() != null 
					&& pointProduct.getProductCode().equals(ProductCode)) {
				
				PointProductById = pointProduct;
				break;
			}
		}
		return PointProductById;
	}
	
	public void addPointProduct(PointProduct pointProduct) {
		productList.add(pointProduct);
	}
}
