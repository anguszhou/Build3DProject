package cn.edu.xjtu.ects.web;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.apache.struts.upload.FormFile;

public class UploadAction extends MappingDispatchAction {

	public ActionForward upload(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
        System.out.println("shangchuang");
		UploadForm fileForm = (UploadForm) form;
		FormFile file = fileForm.getFile();
		String filePath = request.getRealPath("/songs");
		FileOutputStream fileOutput = new FileOutputStream(filePath + "/" + file.getFileName());
		
		//处理保存的url，方便删除是使用
		String url = filePath + "/" + file.getFileName();
		url = url.replace("\\", "/");
		System.out.println(url);
		fileOutput.write(file.getFileData());
		fileOutput.flush();
		fileOutput.close();
		file.destroy();
		System.out.println("upload ok");	
		return mapping.findForward("successUpload");
	}
   
}
