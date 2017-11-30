package com.obs.domain;


import java.util.List;

public class Page {
    private int totalPage;
    private int pageSize=1;
    private int totalRecord;
    private int curPage;
    private List list;
    private int startPage;
    private int endPage;
    private int startIndex;

    public Page(int curPage,int totalRecord){
        this.curPage=curPage;
        this.totalRecord=totalRecord;
        this.totalPage=(totalRecord+pageSize-1)/pageSize;
        this.startIndex=(curPage-1)*pageSize+1;
        this.startPage= curPage==1? 1:curPage-1;
        this.endPage= curPage==totalPage? totalPage:curPage+1;
        if (totalPage<=3)
        {
            startPage=1;
            endPage=totalPage;
        }

    }
    public int getTotalpage() {
        return totalPage;
    }

    public void setTotalpage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPagesize() {
        return pageSize;
    }

    public void setPagesize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalrecord() {
        return totalRecord;
    }

    public void setTotalrecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getPagenum() {
        return curPage;
    }

    public void setPagenum(int curPage) {
        this.curPage = curPage;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getStartpage() {
        return startPage;
    }

    public void setStartpage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndpage() {
        return endPage;
    }

    public void setEndpage(int endpage) {
        this.endPage = endPage;
    }

    public int getStartindex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }
}
