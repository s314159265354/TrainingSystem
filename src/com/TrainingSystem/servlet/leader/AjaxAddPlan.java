package com.TrainingSystem.servlet.leader;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TrainingSystem.service.leader.PlanManage;

/**
 * Servlet implementation class AjaxAddPlan
 */
@WebServlet("/AjaxAddPlan")
public class AjaxAddPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddPlan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");	
		
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userID");
		if (uid == "" || uid == null) {
			response.getWriter().write("false");
			return;
		}
		if (!((String) session.getAttribute("userClass")).equals("a")) {
			response.getWriter().write("false");
			return;
		}
		
		//String pid = request.getParameter("ID");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		
		String nowdate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		if (sdate.compareTo(edate) >= 0 || edate.compareTo(nowdate) < 0)
		{
			response.getWriter().write("false");
			return;
		}

		try {
			if (PlanManage.insertPlan(sdate, edate) == 1) {
				response.getWriter().write("true");
			}
			else {
				response.getWriter().write("false");
			}
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}

}
