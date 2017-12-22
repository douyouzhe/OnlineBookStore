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
    public void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException
    {

        String method=request.getParameter("method");

        if(method.equalsIgnoreCase("getAll"))
        {
            getAll(request,response);
        }else if(method.equalsIgnoreCase("listBookOfThisCategory"))
        {
            listBookOfThisCategory(request,response);
        }
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException
    {

        String method=request.getParameter("method");

        if(method.equalsIgnoreCase("getAll"))
        {
            getAll(request,response);
        }else if(method.equalsIgnoreCase("listBookOfThisCategory"))
        {
            listBookOfThisCategory(request,response);
        }

    }
    private void getAll(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException
    {
        System.out.println(1);
        BusinessServiceImpl service=new BusinessServiceImpl();
        List<Category> categories=service.getAllCategory();
        request.setAttribute("categories",categories);
        request.setAttribute("showType", "category");
        String curPage=request.getParameter("curPage");
        Page page=service.getBookPageData(curPage);
        System.out.println(page.getCurPage());
        request.setAttribute("page",page);
        request.getRequestDispatcher("/client/head.jsp").forward(request,response);
    }

    private void listBookOfThisCategory(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException
    {
        BusinessServiceImpl service=new BusinessServiceImpl();
        String category_id=request.getParameter("category_id");
        String curPage=request.getParameter("curPage");
        Page page=service.getBookPageData(curPage,category_id);
        request.setAttribute("showType", "category");
        request.setAttribute("page",page);
        request.getRequestDispatcher("/client/head.jsp").forward(request,response);
    }
}