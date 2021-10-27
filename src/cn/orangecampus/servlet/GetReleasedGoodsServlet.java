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
import java.util.List;

/**
 * @author 16321
 */
@WebServlet("/getReleased")
public class GetReleasedGoodsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        List<GoodsDetail>list= GoodsRepository.getGoodsDetailList(userId);
        StringBuilder sb=new StringBuilder();
        ObjectMapper mapper=new ObjectMapper();
        for(GoodsDetail item:list){
            sb.append(mapper.writeValueAsString(item));
            sb.append("#");
        }
        if(!sb.toString().equals("")){
            sb.deleteCharAt(sb.length()-1);
        }
        resp.getWriter().write(sb.toString());
    }
}
