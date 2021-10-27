package cn.orangecampus.servlet;

import cn.orangecampus.repository.CommentRepository;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
@WebServlet("/addComment")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory fileItemFactory=new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
        int goodsId,userId,score;
        goodsId=userId=score=0;
        String commentContent="";
        try {
            List<FileItem>list=servletFileUpload.parseRequest(req);
            goodsId=Integer.parseInt(list.get(0).getString("UTF-8"));
            userId=Integer.parseInt(list.get(1).getString("UTF-8"));
            commentContent=list.get(2).getString("UTF-8");
            score=Integer.parseInt(list.get(3).getString("UTF-8"));
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        //将这条评论加入数据库表中
        CommentRepository.addComment(goodsId,userId,commentContent,score);
    }
}
