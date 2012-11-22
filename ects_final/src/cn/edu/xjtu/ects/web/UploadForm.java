package cn.edu.xjtu.ects.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

public class UploadForm extends ActionForm {

	private FormFile file;

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}
	
	public void reset(ActionMapping mapping,
			HttpServletRequest req) {
		file = null;
	}
	
}
