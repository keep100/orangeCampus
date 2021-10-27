package cn.orangecampus.servlet;

import cn.orangecampus.entity.Cart;
import cn.orangecampus.repository.CartRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 16321
 */
@WebServlet("/delAll")
public class DelAllCartRecordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        CartRepository.delAllRecord(userId);
        resp.sendRedirect("myCart.jsp");
    }
}
