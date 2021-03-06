package wp.Ryo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wp.Ryo.bean.Exam;
import wp.Ryo.bean.QuestionInfo;
import wp.Ryo.bean.User;
import wp.Ryo.bean.UserInfo;
import wp.Ryo.model.DBQuestion;
import wp.Ryo.model.DBUser;
import wp.Ryo.model.DBExam;


@WebServlet("/themkhoathi")
public class addDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public addDepartment() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 // nhận giá trị từ request
			String examId = (String) request.getParameter("exId");
			String departmentId = (String) request.getParameter("deId");

			
			
			// đưa dữ liệu vào gói model
			Exam ex = new Exam();
			ex.setExamId(examId);
			
			UserInfo us = new UserInfo();
			us.setDepartmentId(departmentId);
			
			DBExam db = new DBExam();
			
			if (db.addDepartment(ex, us)) {
				// thông báo thành công
				request.setAttribute("thongbao", 10);
				request.getRequestDispatcher("/WEB-INF/TestManagePage.jsp").forward(request, response);
			}
			else
			{	
				//thông báo trùng tên
				request.setAttribute("thongbao", 11);
				request.getRequestDispatcher("/WEB-INF/TestManagePage.jsp").forward(request, response);
			}	
			
		
			
		}
		catch (Exception e) {
			//thông báo thất bại do hệ thống
			request.setAttribute("thongbao", 12);
			request.getRequestDispatcher("/WEB-INF/TestManagePage.jsp").forward(request, response);
		}
	}
	
}
