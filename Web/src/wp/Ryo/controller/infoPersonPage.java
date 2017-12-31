package wp.Ryo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/thongtincanhan")
public class infoPersonPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public infoPersonPage() {
        super();      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/InfoPerson.jsp").forward(request, response);
	}

}
