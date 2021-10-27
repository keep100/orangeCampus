package cn.orangecampus.servlet;

import cn.orangecampus.entity.WantRecord;
import cn.orangecampus.repository.WantRecordRepository;
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
@WebServlet("/getRecords")
public class GetWantRecordsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int currentPage=Integer.parseInt(req.getParameter("currentPage"));
        int pages=WantRecordRepository.pages();
        List<WantRecord>list=WantRecordRepository.getRecords(currentPage);
        StringBuilder sb=new StringBuilder();
        ObjectMapper mapper=new ObjectMapper();
        for(WantRecord wantRecord:list){
            sb.append(mapper.writeValueAsString(wantRecord));
            sb.append("#");
        }
        sb.append(pages);
        resp.getWriter().write(String.valueOf(sb));
    }
}
