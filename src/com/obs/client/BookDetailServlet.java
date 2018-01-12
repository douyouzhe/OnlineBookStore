package com.obs.client;



        import com.obs.domain.Book;
        import com.obs.domain.Category;
        import com.obs.domain.Page;
        import com.obs.service.BusinessServiceImpl;

        import javax.servlet.ServletException;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;
        import java.util.List;

public class BookDetailServlet extends HttpServlet{




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String bookid=req.getParameter("thisBookID");
            BusinessServiceImpl service=new BusinessServiceImpl();
            Book book=service.findBook(bookid);
            req.setAttribute("book",book);
            req.getRequestDispatcher("/client/bookDetail.jsp").forward(req,resp);
        }catch(Exception e){
            e.printStackTrace();
            req.setAttribute("message", "Something Went Wrong, please try again");
            req.getRequestDispatcher("/message.jsp").forward(req,resp);
        }
    }

}
