package cn.orangecampus.servlet;

import cn.orangecampus.entity.Comments;
import cn.orangecampus.repository.CommentRepository;
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
@WebServlet("/getComment")
public class GetCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int goodsId=Integer.parseInt(req.getParameter("goodsId"));
        int commentType=Integer.parseInt(req.getParameter("commentType"));
        List<Comments>comments= CommentRepository.getTypeComment(goodsId,commentType);
        ObjectMapper mapper=new ObjectMapper();
        StringBuilder sb=new StringBuilder();
        int len = comments.size()-1;
        for (Comments comment:comments){
            String json=mapper.writeValueAsString(comment);
            sb.append(json);
            if(len>0){
                sb.append("#");
                len--;
            }
        }
        resp.getWriter().write(String.valueOf(sb));
    }
}
