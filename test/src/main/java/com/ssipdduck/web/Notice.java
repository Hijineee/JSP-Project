package com.ssipdduck.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssipdduck.DAO.NoticeDAO;
import com.ssipdduck.DTO.NoticeDTO;

@WebServlet("/notice")
public class Notice extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Notice() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//list에 DT

		NoticeDAO dao = new NoticeDAO();
		List<NoticeDTO> NoticeList = dao.noticeList();
		RequestDispatcher rd = request.getRequestDispatcher("./notice.jsp");
		request.setAttribute("list", NoticeList);
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
















