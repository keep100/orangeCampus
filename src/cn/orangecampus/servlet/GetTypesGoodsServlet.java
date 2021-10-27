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
import java.util.ArrayList;
import java.util.List;

/**
 * @author 16321
 */
@WebServlet("/getTypesGoods")
public class GetTypesGoodsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type=req.getParameter("type");
        int currentPage=Integer.parseInt(req.getParameter("currentPage"));
        int pages= 0;
        List<GoodsDetail>goodsList=new ArrayList<>();
        if(type.equals("all")){
            pages=GoodsRepository.getAllPages();
            goodsList=GoodsRepository.getLimitedGoods(currentPage);
        }
        else{
            pages=GoodsRepository.getTypePages(type);
            goodsList = GoodsRepository.getTypesGoods(type,currentPage);
        }
        StringBuilder sb=new StringBuilder();
        //将java对象转化成JSON字符串
        ObjectMapper mapper = new ObjectMapper();
        for (GoodsDetail goods:goodsList){
            String json=mapper.writeValueAsString(goods);
            sb.append(json);
            sb.append("#");
        }
        sb.append(pages);
        resp.getWriter().write(String.valueOf(sb));
    }
}
