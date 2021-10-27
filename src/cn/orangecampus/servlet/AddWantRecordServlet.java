package cn.orangecampus.servlet;

import cn.orangecampus.repository.UserRepository;
import cn.orangecampus.repository.WantRecordRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 16321
 */
@WebServlet("/addWantRecord")
public class AddWantRecordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        String title=req.getParameter("title");
        String goodsDesc=req.getParameter("goodsDesc");
        int wantPrice=Integer.parseInt(req.getParameter("wantPrice"));
        String weChatId=req.getParameter("weChatId");
        UserRepository.updateWeChatId(userId,weChatId);
        WantRecordRepository.addRecord(userId,title,goodsDesc,wantPrice);
        resp.sendRedirect("find_goods.jsp");
    }
}
