package wp.Ryo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wp.Ryo.bean.User;
import wp.Ryo.bean.UserInfo;
import wp.Ryo.model.DBUser;

@WebServlet("/taomoithanhvien")
public class createUser extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public createUser() {
		super();
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			 // nhận giá trị từ request
			String username = (String) request.getParameter("c_username");
			String password = (String) request.getParameter("c_pw");
			String fullname = (String) request.getParameter("c_fullname");
			String departmentId = (String) request.getParameter("c_department");
			String role = (String) request.getParameter("c_role");
			
			System.out.println(departmentId);
			
			
			// đưa dữ liệu vào gói model
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setRole(Integer.parseInt(role));
			
			UserInfo userinfo = new UserInfo();
			userinfo.setFullname(fullname);
			userinfo.setDepartmentId(departmentId);
			
			DBUser db = new DBUser();
			//kiểm tra validate cho password vào username 
			if(password.trim().length()>=2 && password.trim().length()<=20 && username.trim().length()>=2 && username.trim().length()<=30)
			{
				// check username đã tồn tại chưa
				if (db.signupUser(user, userinfo)) {
					
					// thông báo thành công
					request.setAttribute("thongbao", 11);
					request.getRequestDispatcher("/WEB-INF/AdminPage.jsp").forward(request, response);
				}
				else
				{	
					
					//thông báo trùng tên
					request.setAttribute("thongbao", 10);
					request.getRequestDispatcher("/WEB-INF/AdminPage.jsp").forward(request, response);
				}	
			}
			else
			{	
				//thông báo thất bại do validate
				request.setAttribute("thongbao", 12);
				request.getRequestDispatcher("/WEB-INF/AdminPage.jsp").forward(request, response);
			}	
			
		}
		catch (Exception e) {
			//thông báo thất bại do hệ thống
			request.setAttribute("thongbao", 13);
			request.getRequestDispatcher("/WEB-INF/AdminPage.jsp").forward(request, response);
		}
	}

}
