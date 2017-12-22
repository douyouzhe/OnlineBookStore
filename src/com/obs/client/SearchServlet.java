package com.obs.client;

import com.obs.domain.Book;
import com.obs.service.BusinessServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SearchServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String bookName = request.getParameter("search");

            BusinessServiceImpl service = new BusinessServiceImpl();
            Book book=service.findBookByName(bookName);
            //System.out.println(book.getName());
            System.out.println(book.getPrice());
            request.setAttribute("showType", "searchResult");
            request.setAttribute("targetBook",book );
            request.getRequestDispatcher("/client/head.jsp").forward(request, response);

        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("message", "Sorry,search failed!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }

}