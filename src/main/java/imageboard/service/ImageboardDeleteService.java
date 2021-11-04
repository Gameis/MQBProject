package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String seq = request.getParameter("seq");
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.deleteImageboard(seq);
		
		request.setAttribute("display", "/imageboard/imageboardList.jsp");
		return "/index.jsp";
	}

}
