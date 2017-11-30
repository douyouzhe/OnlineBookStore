package com.obs.client;

import com.obs.domain.Book;
import com.obs.domain.Cart;
import com.obs.service.BusinessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AddToCartServlet extends HttpServlet{




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String bookId = req.getParameter("bookId");
            BusinessServiceImpl service = new BusinessServiceImpl();
            Book book = service.findBook(bookId);
            Cart cart = (Cart)req.getSession().getAttribute("cart");
            if(cart ==null){
                cart = new Cart();
                req.getSession().setAttribute("cart",cart);
            }
            service.addBooktoCart(cart,book);
//            PrintWriter out = resp.getWriter(  );
//            resp.setContentType("text/html");
//            System.out.println(req.getContextPath());
//            out.println("<P>Book added");
//            out.println("<br><br>");
//            out.println("<P><a href='"+req.getContextPath()+"/client/head.jsp> Continue shopping </a>");
//            out.println("<br><br>");
//            out.println("<P><a href='"+req.getContextPath()+"/client/listCart.jsp> Check out </a>");

            resp.setContentType("text/html");
            PrintWriter out = resp.getWriter();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Hola</title>");
            out.println("</head>");
            out.println("<body bgcolor=\"white\">");
            out.println("<p>Book added</p>");
            out.println("<p><a href="+req.getContextPath()+"/client/head.jsp> Continue shopping </a></p>");
            out.println("<p><a href="+req.getContextPath()+"/client/listCart.jsp> Check out </a></p>");

            out.println("</body>");
            out.println("</html>");


        }catch(Exception e){
            e.printStackTrace();
            req.setAttribute("message", "Something Went Wrong, please try again");
            req.getRequestDispatcher("/message.jsp").forward(req,resp);
        }
    }
}
