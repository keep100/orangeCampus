package cn.orangecampus.servlet;

import cn.orangecampus.entity.GoodsDetail;
import cn.orangecampus.repository.GoodsRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 16321
 */
@WebServlet("/getOneGoods")
public class GetOneGoodsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        GoodsDetail goodsDetail= GoodsRepository.getOneGoods(id);
        ObjectMapper mapper = new ObjectMapper();
        String json=mapper.writeValueAsString(goodsDetail);
        resp.getWriter().write(json);
    }
}
