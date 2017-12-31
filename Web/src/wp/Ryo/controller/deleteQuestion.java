package wp.Ryo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wp.Ryo.bean.Question;
import wp.Ryo.model.DBQuestion;

@WebServlet("/xoacauhoi")
public class deleteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deleteQuestion() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// nhận mã câu hỏi từ request
		String questionId = (String) request.getParameter("MaCauHoi");
		//MaCauHoi la gia tri ben form xoa cau hoi cua trang mod
		
		// đưa dữ liêụ vào model
		DBQuestion db = new DBQuestion();
		Question qs= new Question();
		qs.setQuestionId(questionId);
		
		try {
			// gọi hàm xóa user từ gói model
			if (db.deleteQuestion(qs)) {
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/QuestionPage.jsp").forward(request, response);
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 1);
				request.getRequestDispatcher("/WEB-INF/QuestionPage.jsp").forward(request, response);
			}
		}
		
		catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 2);
			request.getRequestDispatcher("/WEB-INF/QuestionPage.jsp").forward(request, response);
		}	
		
	}

}
