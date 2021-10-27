package cn.orangecampus.servlet;

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
@WebServlet("/delOneCartRecord")
public class DelOneCartRecordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        int goodsId=Integer.parseInt(req.getParameter("goodsId"));
        CartRepository.delOneRecord(userId,goodsId);
    }
}
