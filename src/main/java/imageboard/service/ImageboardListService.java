package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pg = request.getParameter("pg");
		
		request.setAttribute("pg", pg);
		
		request.setAttribute("display", "/imageboard/imageboardList.jsp");
		return "/index.jsp";
	}

}
