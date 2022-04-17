package cn.orangecampus.servlet;

import cn.orangecampus.entity.User;
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
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

/**
 * @author 16321
 */
@WebServlet("/updateUserInfo")
public class UpdateUserInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
        try {
            List<FileItem> list = fileUpload.parseRequest(req);
            String username = list.get(0).getString("UTF-8");
            String signature = list.get(1).getString("UTF-8");
            String weChatId = list.get(3).getString("UTF-8");
            int id = Integer.parseInt(list.get(4).getString("UTF-8"));
            FileItem fileItem = list.get(2);
            if (fileItem.getName().equals("")) {
                UserRepository.updateUserInfo(username, id, weChatId, "", signature);
            } else {
                //处理上传的头像
                String iconName = list.get(5).getString("UTF-8");
                String fileFormat = fileItem.getName().substring(fileItem.getName().lastIndexOf(".")).toLowerCase();
                String path = req.getServletContext().getRealPath("userIcons/" + iconName + fileFormat);

                InputStream inputStream = fileItem.getInputStream();
                OutputStream outputStream = new FileOutputStream(path);
                //将图片写到对应的位置
                int temp = 0;
                while ((temp = inputStream.read()) != -1) {
                    outputStream.write(temp);
                }
                outputStream.close();
                inputStream.close();
                //更新到数据库
                String iconUrl = "userIcons/" + iconName +
                        fileFormat;
                UserRepository.updateUserInfo(username, id, weChatId, iconUrl, signature);
            }

            //获取刚刚更新的用户
            User user = UserRepository.getOneUser(id);
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }
}
