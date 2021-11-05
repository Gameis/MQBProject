package product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class GetProductListService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		ProductDAO productDAO = ProductDAO.getInstance();
		List<ProductDTO> list = productDAO.getProductList();
		
		// List -> JSON 변환
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(ProductDTO productDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq", productDTO.getSeq());
				temp.put("img", productDTO.getImg());
				temp.put("name", productDTO.getName());
				temp.put("unit", productDTO.getUnit());
				temp.put("qty", productDTO.getQty());
				temp.put("total", productDTO.getTotal());
				temp.put("rate", productDTO.getRate());
				temp.put("discount", productDTO.getDiscount());
				temp.put("price", productDTO.getPrice());
	            
	            array.add(temp);
			}//for
			
			json.put("list", array);
			
		}//if
		
		request.setAttribute("list", json);
		return "/product/getProductList.jsp";
	}

}
