package wp.Ryo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wp.Ryo.bean.Exam;
import wp.Ryo.bean.User;
import wp.Ryo.bean.QuestionInfo;
import wp.Ryo.model.DBExam;
import wp.Ryo.model.DBUser;

@WebServlet("/taokythi")
public class checkNumQues extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public checkNumQues() {
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Nhận giá trị từ request
			String examId = (String) request.getParameter("MaDeThi");
			
			// đưa dữ liệu vào lớp model
			Exam ex = new Exam();
			ex.setExamId(examId);
			
			System.out.println(examId);
			
			DBExam db = new DBExam();
			
			if (db.getNumQues(ex) == 0) {
				request.setAttribute("t_exID", examId);
				request.getRequestDispatcher("/WEB-INF/CreateExam.jsp").forward(request, response);
			}
			else {
				request.setAttribute("thongbao", 21);
				request.getRequestDispatcher("/WEB-INF/TestManagePage.jsp").forward(request, response);
			}
			
		}
		catch(Exception e) {
			request.setAttribute("thongbao", 21);
			request.getRequestDispatcher("/WEB-INF/TestManagePage.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			 // nhận giá trị từ request
			String examId = (String) request.getParameter("exId");
			String num = (String) request.getParameter("num");
			String subject = (String) request.getParameter("sub");
			String level = (String) request.getParameter("level");
			
			
			// đưa dữ liệu vào gói model
			Exam ex = new Exam();
			ex.setExamId(examId);
			ex.setSubject(subject);
			
			QuestionInfo qsinfo = new QuestionInfo();
			qsinfo.setLevel(level);
			
			DBExam db = new DBExam();
			
			//kiểm tra validate cho password vào username
			int n = Integer.parseInt(num);
			for(int i=0; i<n;)
			{
				
				if (db.addQuesToExam(ex,qsinfo)) {
					i++;
				}
				else {
				}
			}
			request.setAttribute("thongbao", 20);
			request.getRequestDispatcher("/WEB-INF/ExamManagePage.jsp").forward(request, response);
			
		}
		catch (Exception e) {
			//thông báo thất bại do hệ thống
			request.setAttribute("thongbao", 21);
			request.getRequestDispatcher("/WEB-INF/TestManagePage.jsp").forward(request, response);
		}
	
	}
}