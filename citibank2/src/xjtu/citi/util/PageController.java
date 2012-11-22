package xjtu.citi.util;

/**
 * @author xubin
 * @date 2007-3-16
 * @version xb1.0 
 * @description ���ڷ�ҳ��ʾ�Ĺ����࣬��Ҫ���ڷ�װ��ҳ��ʾ�Ļ�������
 */
import java.util.Collection;

public class PageController {


	  //������
	  int totalRowsAmount;
	  //ÿҳ����
	  int pageSize = 5;
	  //��ҳ��
	  int totalPages;

	  //��ǰҳ��
	  int currentPage = 1;
	  //��һҳ
	  int nextPage;
	  //��һҳ
	  int previousPage;
	  //�Ƿ�����һҳ
	  boolean hasNext;
	  //�Ƿ�����һҳ
	  boolean hasPrevious;

	  //��ǰҳ��ʼ��
	  int pageStartRow;

	  //��ǰҳ������
	  int pageEndRow;
	  private Collection data;

	  /**
	   * ���캯����
	   * @param totalRows ������
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
	   * ������������
	   * @param i ��������
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
	   * ���õ�ǰҳ����
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

	    //���㵱ǰҳ��ʼ�кͽ�����
	    if(currentPage != totalPages){

	      pageStartRow = (currentPage-1)*pageSize +1;

	    }else{
	      pageStartRow = (currentPage - 1)*pageSize+1;
	    }

	    //��¼������0��ʼ
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
