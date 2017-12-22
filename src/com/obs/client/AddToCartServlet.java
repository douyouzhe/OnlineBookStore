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
            req.getRequestDispatcher("/client/addedToCart.jsp").forward(req,resp);
//            resp.setContentType("text/html");
//            PrintWriter out = resp.getWriter();

//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>book added</title>");
//
//            out.println("<style> a:hover { text-decoration:underline;color: gray}");
//            out.println("a{text-decoration: none; color=white}");
//            out.println(" p{color:white; font-size:3rem; text_align:center;}");
//            out.println("</style>");
//
//            out.println("</head>");
//
//
//            out.println("<body bgcolor=\"black\">");
//            out.println("<img src=\"${pageContext.request.contextPath }/icons/addedToCart.png\" width=10>");
//            out.println("<img src=\"${pageContext.request.contextPath }/icons/addToCart.png\" width=10/>");
//            out.println("<p>Oh Yeah!<br> We have added this book to your cart</p>");
//            out.println("<p><a href="+req.getContextPath()+"/index?method=getAll > <img src=\"${pageContext.request.contextPath }/icons/ContinueShopping.png\"  height=\"50\"> </a></p>");
//            out.println("<p><a href="+req.getContextPath()+"/client/listCart.jsp> Check out </a></p>");
//
//            out.println("</body>");
//            out.println("</html>");


        }catch(Exception e){
            e.printStackTrace();
            req.setAttribute("message", "Something Went Wrong, please try again");
            req.getRequestDispatcher("/message.jsp").forward(req,resp);
        }
    }
}
