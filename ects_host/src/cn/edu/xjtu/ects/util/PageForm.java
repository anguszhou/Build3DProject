package cn.edu.xjtu.ects.util;

import org.apache.struts.action.ActionForm;

/**
 * @author xubin
 * @date 2007-3-16
 * @version xb1.0
 * @description ���ڷ�ҳ��ʾ�Ĺ����࣬����̳���struts�е� ActionForm,��Ҫ���ڷ�װ��ҳ��ʾ�Ļ�������
 */
public class PageForm extends ActionForm {
	private int currentPageNo;

	private int toPageNo;

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public int getToPageNo() {
		return toPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public void setToPageNo(int toPageNo) {
		this.toPageNo = toPageNo;
	}

}
