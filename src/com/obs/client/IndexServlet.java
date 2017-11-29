package com.obs.client;


import com.obs.domain.Category;
import com.obs.domain.Page;
import com.obs.service.BusinessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req,resp);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException
    {

        System.out.println("in doget");
        String method=request.getParameter("method");
        if(method.equalsIgnoreCase("getAll"))
        {
            getAll(request,response);
        }else if(method.equalsIgnoreCase("listBooksOfSomeCategory"))
        {
            listBookOfThisCategory(request,response);
        }

    }

    private void getAll(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException
    {

        System.out.println("in getAll");
        BusinessServiceImpl service=new BusinessServiceImpl();
        List<Category> categories=service.getAllCategory();
        for(Category c: categories){
            System.out.println(c);
        }

        request.setAttribute("categories",categories);
        String curPage=request.getParameter("curPage");
        Page page=service.getBookPageData(curPage);
        request.setAttribute("Page",page);
        request.getRequestDispatcher("/client/head.jsp").forward(request,response);
    }

    private void listBookOfThisCategory(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException
    {
        BusinessServiceImpl service=new BusinessServiceImpl();
        String category_id=request.getParameter("category_id");
        String curPage=request.getParameter("curPage");
        Page page=service.getBookPageData(curPage,category_id);
        request.setAttribute("curPage",curPage);
        request.getRequestDispatcher("/client/head.jsp").forward(request,response);
    }
}