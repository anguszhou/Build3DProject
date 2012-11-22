package cn.edu.xjtu.ects.util;

/**
 * @author xubin
 * @date 2007-3-16
 * @version xb1.0 
 * @description 用于分页显示的工具类，主要用于封装分页显示的基本数据
 */
import java.util.Collection;

public class PageController {


	  //总行数
	  int totalRowsAmount;
	  //每页行数
	  int pageSize = 5;
	  //总页数
	  int totalPages;

	  //当前页码
	  int currentPage = 1;
	  //下一页
	  int nextPage;
	  //上一页
	  int previousPage;
	  //是否有下一页
	  boolean hasNext;
	  //是否有上一页
	  boolean hasPrevious;

	  //当前页开始行
	  int pageStartRow;

	  //当前页结束行
	  int pageEndRow;
	  private Collection data;

	  /**
	   * 构造函数。
	   * @param totalRows 总行数
	   */
	  public PageController(int totalRows,int currentPage) {
	    setPageController(totalRows,currentPage);
	  }

	  public PageController(int totalRows,int currentPage,int pageSize){
	      this.pageSize = pageSize;
	      this.setPageController(totalRows,currentPage);
	  }

	  public void setPageController(int totalRows,int currentPage){

	    setTotalRowsAmount(totalRows);
	    setCurrentPage(currentPage);
	  }

	  /**
	   * 设置总行数。
	   * @param i 总行数。
	   */
	  private void setTotalRowsAmount(int rows) {

	    if(rows <0 ){
	      totalRowsAmount =  0;
	    }else{
	      totalRowsAmount = rows;
	    }

	    if(totalRowsAmount%pageSize==0){
	      totalPages = totalRowsAmount / pageSize;
	    }else{
	      totalPages = totalRowsAmount / pageSize + 1;
	    }
	  }

	  /**
	   * 设置当前页数。
	   * @param i
	   */
	  private void setCurrentPage( int curPage) {

	    if(curPage <= 0){
	      currentPage = 1;
	    }else if(curPage > totalPages){
	      currentPage = totalPages;
	    }else{
	      currentPage = curPage;
	    }

	    if(currentPage == 1){
	      hasPrevious = false;
	    }else{
	      hasPrevious = true;
	    }

	    if(currentPage == totalPages){
	      hasNext = false;
	    }else{
	      hasNext = true;
	    }


	    nextPage = currentPage + 1;
	    previousPage = currentPage - 1;

	    //计算当前页开始行和结束行
	    if(currentPage != totalPages){

	      pageStartRow = (currentPage-1)*pageSize +1;

	    }else{
	      pageStartRow = (currentPage - 1)*pageSize+1;
	    }

	    //记录索引从0开始
	    pageStartRow -= 1;
	    pageEndRow = pageStartRow + pageSize;

	  }

	  public int getCurrentPage() {
	    return currentPage;
	  }

	  public boolean isHasNext() {
	    return hasNext;
	  }

	  public boolean isHasPrevious() {
	    return hasPrevious;
	  }

	  public int getNextPage() {
	    return nextPage;
	  }

	  public int getPageSize() {
	    return pageSize;
	  }

	  public int getPreviousPage() {
	    return previousPage;
	  }

	  public int getTotalPages() {
	    return totalPages;
	  }

	  public int getTotalRowsAmount() {
	    return totalRowsAmount;
	  }

	  public int getPageStartRow() {
	    return pageStartRow;
	  }

	  public int getPageEndRow(){
	      return pageEndRow;
	  }

	  public String description() {
	    String description = "Total:" + this.getTotalRowsAmount() +
	        " items " + this.getTotalPages() + " pages,Current page:" +
	        this.currentPage + " Previous " + this.hasPrevious +
	        " Next:" + this.hasNext +
	        " start row:" + this.pageStartRow +
	        " end row:" + this.pageEndRow;
	    return description;
	  }

	  public void setData(Collection data) {
	    this.data = data;
	  }
	  public Collection getData() {
	    return data;
	  }

	  public static void main(String args[]){

	    Collection c = null;
	    PageController pc = new PageController(0,2);
	    System.out.println(pc.description());
	  }

	}
