package com.ssipdduck.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssipdduck.DAO.LoginDAO;
import com.ssipdduck.DTO.LoginDTO;
import com.ssipdduck.util.Util;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		if (request.getParameter("email") != null 
				&& request.getParameter("pw") != null) {
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			
			LoginDAO dao = new LoginDAO();
			LoginDTO dto = new LoginDTO();
			
			dto.setU_email(Util.HTML2str(email));
			dto.setU_password(pw);
			
			dto = dao.login(dto);
			PrintWriter writer = response.getWriter();
			if(dto.getC()==1) {
				response.sendRedirect("./index.jsp");
				HttpSession session = request.getSession();
				session.setAttribute("u_email", dto.getU_email());
				session.setAttribute("u_nickname", dto.getU_nickname());
			}else{
				
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<meta charset=\"UTF-8\">");	
				writer.println("<script>alert('email,password를 다시확인해주세요.'); location.href='./login.jsp';</script>");
				writer.println("</body>");
				writer.println("</html>");
			}
			
		}
	}

}
