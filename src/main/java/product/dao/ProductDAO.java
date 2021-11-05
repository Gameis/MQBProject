package product.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imageboard.bean.ImageboardDTO;
import product.bean.ProductDTO;

public class ProductDAO {

	private static ProductDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static ProductDAO getInstance() {
		if(instance == null) { 
			synchronized (ProductDAO.class) {
				instance = new ProductDAO(); 
			}
		}
		return instance;
	}
	
	public ProductDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void productWrite(ProductDTO productDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("productSQL.productWrite", productDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<ProductDTO> getProductList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ProductDTO> list = sqlSession.selectList("getProductList");
		sqlSession.close();
		
		return list;
	}
	
}
