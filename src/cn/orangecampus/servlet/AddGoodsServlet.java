package cn.orangecampus.servlet;

import cn.orangecampus.repository.GoodsRepository;
import cn.orangecampus.repository.UserRepository;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

/**
 * @author 16321
 */
@WebServlet("/addGoods")
public class AddGoodsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory fileItemFactory=new DiskFileItemFactory();
        ServletFileUpload servletFileUpload=new ServletFileUpload(fileItemFactory);
        String goodsName,goodsDesc,type,labels,weChatId,imgName;
        int price,userId;
        StringBuilder imgUrl=new StringBuilder();
        goodsName=goodsDesc=type=labels=weChatId= "";
        price=userId=0;
        //读取前端传过来的formData的值
        try {
            List<FileItem>list=servletFileUpload.parseRequest(req);
            goodsName=list.get(0).getString("UTF-8");
            goodsDesc=list.get(1).getString("UTF-8");
            price= Integer.parseInt(list.get(2).getString("UTF-8"));
            type=list.get(3).getString("UTF-8");
            weChatId=list.get(4).getString("UTF-8");
            userId=Integer.parseInt(list.get(6).getString("UTF-8"));
            labels=list.get(7).getString("UTF-8");
            //上传过来的随机图片名称
            imgName=list.get(8).getString("UTF-8");
            //读取上传过来的图片
            FileItem fileItem=list.get(5);
            InputStream inputStream=fileItem.getInputStream();
            //图片格式
            String fileFormat = fileItem.getName().substring(fileItem.getName().lastIndexOf(".")).toLowerCase();
            String path=req.getServletContext().getRealPath("goodsImages/"+imgName+fileFormat);
            imgUrl.append("goodsImages/");
            imgUrl.append(imgName);
            imgUrl.append(fileFormat);
            //在相应路径下写图片
            OutputStream outputStream=new FileOutputStream(path);
            int temp=0;
            while((temp=inputStream.read())!=-1){
                outputStream.write(temp);
            }
            outputStream.close();
            inputStream.close();
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        //将该用户的weChatId更新
        UserRepository.updateWeChatId(userId,weChatId);
        //将该记录加入到商品详情记录中
        int addSuccess=GoodsRepository.addGoodsRecord(userId,goodsName,goodsDesc,price,labels,type,String.valueOf(imgUrl));
        resp.getWriter().write(String.valueOf(addSuccess));
    }
}
