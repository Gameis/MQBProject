package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CheckPostSearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String sido = request.getParameter("sido");      
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		
		System.out.println(sido+" , "+sigungu+" , "+roadname);

		//DB
		List<ZipcodeDTO>list = null;
		if(sido != null && roadname!=null) {
	         MemberDAO memberDAO = MemberDAO.getInstance();
	         list = memberDAO.getZipcodeList(sido, sigungu, roadname);
	         System.out.println("list = "+list);  //클래스명@16진수   [~~~, ~~~,  ]
		}
		
		//list -> json으로 변환
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(ZipcodeDTO zipcodeDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("zipcode", zipcodeDTO.getZipcode());
				temp.put("sido", zipcodeDTO.getSido());
	            temp.put("sigungu", zipcodeDTO.getSigungu());
	            temp.put("yubmyundong", zipcodeDTO.getYubmyundong());
	            temp.put("ri", zipcodeDTO.getRi());
	            temp.put("roadname", zipcodeDTO.getRoadname());
	            temp.put("buildingname", zipcodeDTO.getBuildingname());
	            
	            array.add(temp);
			}//for
			
			json.put("list", array);
		}
		
		System.out.println("json = " + json);
		
		request.setAttribute("list", json);
		return "/member/checkPostSearch.jsp";
	}

}








