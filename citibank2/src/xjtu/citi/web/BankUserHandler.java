package xjtu.citi.web;


import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;



import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Session;

import xjtu.citi.dao.IBankUserDao;
import xjtu.citi.dao.ICompanyInfoDao;
import xjtu.citi.dao.ICompanyUserDao;
import xjtu.citi.dao.IFeedbackDao;
import xjtu.citi.dao.IParameterDao;
import xjtu.citi.dao.ISMEassessmentDao;
import xjtu.citi.dao.IWarnInfoDao;
import xjtu.citi.dao.IWarnParameterDao;
import xjtu.citi.entity.BankUser;
import xjtu.citi.entity.CompanyInfo;
import xjtu.citi.entity.CompanyUser;
import xjtu.citi.entity.Feedback;
import xjtu.citi.entity.Parameter;

import xjtu.citi.entity.SMEassessment;

import xjtu.citi.entity.WarnInfo;

import xjtu.citi.entity.WarnParameter;
import xjtu.citi.exception.ManagerUserException;
import xjtu.citi.impl.BankUserDaoImpl;
import xjtu.citi.impl.CompanyInfoDaoImpl;
import xjtu.citi.impl.CompanyUserDaoImpl;
import xjtu.citi.impl.FeedbackDaoImpl;
import xjtu.citi.impl.ParameterDaoImpl;
import xjtu.citi.impl.SMEassessmentDaoImpl;
import xjtu.citi.impl.WarnInfoDaoImpl;
import xjtu.citi.impl.WarnParameterDaoImpl;




import xjtu.citi.entity.UserType;
import xjtu.citi.dao.IUserTypeDao;
import xjtu.citi.impl.UserTypeImpl;
import xjtu.citi.util.PageController;

public class BankUserHandler extends MappingDispatchAction{

	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		int tag = 0;
		IBankUserDao dao = new BankUserDaoImpl();
		BankUser user = new BankUser();
		IParameterDao dao1 = new ParameterDaoImpl();
		IWarnParameterDao dao2 = new WarnParameterDaoImpl();
		ICompanyUserDao dao3 = new CompanyUserDaoImpl();
		ICompanyInfoDao dao6 = new CompanyInfoDaoImpl();
		CompanyInfo info = new CompanyInfo();
		CompanyUser user2 = new CompanyUser();
		
		IWarnInfoDao dao4 = new WarnInfoDaoImpl();
		Collection<WarnInfo> wi = dao4.getWarnInfo();
		req.getSession().setAttribute("warninfos", wi);
		
		ISMEassessmentDao dao5 = new SMEassessmentDaoImpl();
		Collection<SMEassessment> sme = dao5.getSMEassess();
		req.getSession().setAttribute("smeassessments", sme);
		
		System.out.println(req.getParameter("name")+"  "+req.getParameter("name"));
		try {			
			
			user2 = dao3.login(req.getParameter("name"), req.getParameter("password"));
			user = dao.login(req.getParameter("name"), req.getParameter("password"));
			//System.out.println(user2.getName());
			//System.out.println(user.getName());
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
		}
		if(user != null && user2 ==null)
		{	
			req.getSession().setAttribute("tag", tag);
			req.getSession().setAttribute("user", user);
			if(user.getUsertype().getId() == 1){         //登录角色为信贷员
				return mapping.findForward("success1");
			}else if(user.getUsertype().getId() == 2){   //登录角色为风险评估员
				Parameter parameter = dao1.find();
				WarnParameter warnparameter = dao2.find();
				req.getSession().setAttribute("parameter", parameter);
				req.getSession().setAttribute("warnparameter", warnparameter);
				return mapping.findForward("success2");
			
			}else   //登录角色为后台管理员
				return mapping.findForward("success3");
		}
		else if(user2 != null && user == null)
		{
			tag = 1;
			info = dao6.findById(user2.getCompanyinfo().getId());
			req.getSession().setAttribute("tag", tag);
			req.getSession().setAttribute("user", user2);
			req.getSession().setAttribute("companyinfo", info);
			return mapping.findForward("success4");  //登录角色为企业用户
		}
		else
		{
			req.setAttribute("message", "用户名或密码有误，请重新登录！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}	
	}
	
	public ActionForward bankModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		IBankUserDao dao = new BankUserDaoImpl();
		BankUser user = (BankUser)req.getSession().getAttribute("user");	
		user.setPassword(req.getParameter("password"));
		user.setId(user.getId());
		try {			
			dao.update(user);		
		} catch (ManagerUserException e) {
			e.printStackTrace();
		}

		req.getSession().setAttribute("user", user);	
				
		return mapping.findForward("bankModify");
	}
	
	public ActionForward bankHome(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		/*------------显示核心企业列表-------------------*/
		ICompanyInfoDao dao = new CompanyInfoDaoImpl();
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}
		
		//目标页ID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);		
		pc.setPageController(pc.getTotalRowsAmount(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
		pc.setData(dao.findCore((destPage-1)*pc.getPageSize(), pc.getPageSize()));
		
		//构造分页选择器
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString() );
		Collection<CompanyInfo> ten = pc.getData();
		for(CompanyInfo i : ten)
		{
			System.out.println(i.getName());
		}
		
		
		/*------------显示中小企业列表-------------------*/
		PageController pc1 =(PageController) req.getSession().getAttribute("pageControl");
		if(pc1 == null)
		{			
			pc1 = new PageController(dao.getTotal2(),1,6);
			req.getSession().setAttribute("pageController1", pc1);
		}
		//目标页ID
		int destPage1 = 1;
		String strDestPage1 = req.getParameter("destId");
		if(strDestPage1 != null && !strDestPage1.equals(""))
			destPage1 = Integer.parseInt(strDestPage1);		
		pc1.setPageController(pc1.getTotalRowsAmount(), destPage1);
		
		//以下代码中只需要修改dao调用的函数即可
		
			pc1.setData(dao.findSME((destPage-1)*pc1.getPageSize(), pc1.getPageSize()));
			String type = req.getParameter("type");
			//req.getSession().setAttribute("type", type);
		
		//构造分页选择器
		StringBuffer selector1 = new StringBuffer();
		int start1 = destPage1>=6?destPage1-5:1;
		int end1 = destPage1+5>=pc1.getTotalPages()?pc1.getTotalPages():destPage1+5;
		for (int i=start1;i<destPage1;i++)		
			selector1.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector1.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage1+1;i<=end1;i++)		
			selector1.append("<option value='").append(i).append("'>").append(i).append("</option>");
		req.setAttribute("pageSelector",selector1.toString() );
		Collection<SMEassessment> ten1 = pc1.getData();
		for(SMEassessment i : ten1)
		{
			System.out.println(i.getId());
		}
		
		
		/*------------参数修改设置-----------------
		IParameterDao dao1 = new ParameterDaoImpl();
		Parameter parameter = new Parameter();
		parameter = (Parameter) req.getSession().getAttribute("parameter");
		
		parameter.setCashflow(Double.parseDouble(req.getParameter("cashflow")));
		parameter.setRegistfund(Double.parseDouble(req.getParameter("registfund")));
		parameter.setListedcomp(Double.parseDouble(req.getParameter("listedcomp")));
		parameter.setCorecomp(Double.parseDouble(req.getParameter("corecomp")));
		parameter.setAin(Double.parseDouble(req.getParameter("ain")));
		parameter.setAout(Double.parseDouble(req.getParameter("aout")));
		parameter.setBin(Double.parseDouble(req.getParameter("bin")));
		parameter.setBout(Double.parseDouble(req.getParameter("bout")));
		
		SimpleDateFormat fordate=new SimpleDateFormat("yyyy-MM-dd");
		Date date = fordate.parse(req.getParameter("modifiedtime"));
		parameter.setTime(date);
		
		dao1.modify(parameter);
		req.getSession().setAttribute("parameter",parameter);
		
		
		------------预警参数修改设置-----------------
		IWarnParameterDao dao2 = new WarnParameterDaoImpl();
		WarnParameter warnparameter = new WarnParameter();
		warnparameter = (WarnParameter) req.getSession().getAttribute("warnparameter");
		
		warnparameter.setValue(Double.parseDouble(req.getParameter("value")));
		SimpleDateFormat fordate2=new SimpleDateFormat("yyyy-MM-dd");
		Date date2 = fordate.parse(req.getParameter("modifiedtime"));
		warnparameter.setTime(date2);
		
		dao2.modify(warnparameter);
		
		req.getSession().setAttribute("warnparameter",warnparameter);*/
		
		return mapping.findForward("success");
	}
	

	public ActionForward peopleAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
	{
		IBankUserDao dao = new BankUserDaoImpl();
		BankUser user = new BankUser();
		
		user.setName(req.getParameter("name"));
		user.setUsername(req.getParameter("userName"));
		user.setPassword(req.getParameter("password"));
		user.setDepartment(req.getParameter("department"));
		user.setWorkNum(req.getParameter("worknum"));
		
		IUserTypeDao typedao = new UserTypeImpl();
		UserType usertype=new UserType();


	    usertype=typedao.findByType(req.getParameter("usertype"));
		System.out.println(req.getParameter("usertype"));
		user.setUsertype(usertype);
		try {
			System.out.println(usertype.getId());
			dao.add(user);
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
			req.setAttribute("message", "抱歉，注册失败！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", user);
		
		req.getSession(true).setAttribute("user",user);	
		req.setAttribute("message", "恭喜，注册成功！");
		req.setAttribute("success", true);
		return mapping.findForward("success");
	}
	
	public ActionForward parameter(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws ParseException
	{	
		IParameterDao dao = new ParameterDaoImpl();
		Parameter parameter = new Parameter();
		//Parameter parameter1 = (Parameter) req.getSession().getAttribute("parameter");
		
		parameter.setCashflow(Double.parseDouble(req.getParameter("cashflow")));
		parameter.setRegistfund(Double.parseDouble(req.getParameter("registfund")));
		parameter.setListedcomp(Double.parseDouble(req.getParameter("listedcomp")));
		parameter.setCorecomp(Double.parseDouble(req.getParameter("corecomp")));
		parameter.setAin(Double.parseDouble(req.getParameter("ain")));
		parameter.setAout(Double.parseDouble(req.getParameter("aout")));
		parameter.setBin(Double.parseDouble(req.getParameter("bin")));
		parameter.setBout(Double.parseDouble(req.getParameter("bout")));
		
		SimpleDateFormat fordate=new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		parameter.setTime(date);
		
		System.out.println(parameter.getTime());
		dao.add(parameter);
		System.out.println(parameter.getTime());
		ISMEassessmentDao dao2 = new SMEassessmentDaoImpl();
		dao2.calSMEassess();
		
		IWarnInfoDao dao4 = new WarnInfoDaoImpl();
		Collection<WarnInfo> wi = dao4.getWarnInfo();
		req.getSession().setAttribute("warninfos", wi);
		
		req.getSession().setAttribute("parameter",parameter);
		
		return mapping.findForward("success");
	}
	
	public ActionForward warnparameter(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws ParseException
	{	
		IWarnParameterDao dao = new WarnParameterDaoImpl();
		WarnParameter warnparameter = new WarnParameter();
		warnparameter = (WarnParameter) req.getSession().getAttribute("warnparameter");
		
		warnparameter.setValue(Double.parseDouble(req.getParameter("value")));
		SimpleDateFormat fordate=new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		warnparameter.setTime(date);
		
		dao.modify(warnparameter);
		
		req.getSession().setAttribute("warnparameter",warnparameter);
		
		return mapping.findForward("success");
	}
	public ActionForward backup(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		String path = req.getParameter("savePath");
		System.out.println(path);
		path = path.replaceAll("\\\\", "/");
		System.out.println(path);
		if(path.length()==0)
		{
			path = "E:/";
		}
		try {  
            Runtime rt = Runtime.getRuntime();  
            String command="mysqldump -u "+"root"+" -p "+"1234"+" "+" citi"+" account"+" > "+"e:/bj.sql";
            // 调用 mysql 的 cmd:  
            Process child = rt  
                    .exec("mysqldump -u root --password=1234 --set-charset=utf8 citi");// 设置导出编码为utf8。这里必须是utf8  
             
            // 把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行  
            InputStream in = child.getInputStream();// 控制台的输出信息作为输入流  
                         
            InputStreamReader xx = new InputStreamReader(in, "utf8");// 设置输出流编码为utf8。这里必须是utf8，否则从流中读入的是乱码  
             
            String inStr;  
            StringBuffer sb = new StringBuffer("");  
            String outStr;  
            // 组合控制台输出信息字符串  
            BufferedReader br = new BufferedReader(xx);  
            while ((inStr = br.readLine()) != null) {  
                sb.append(inStr + "\r\n");  
            }  
            outStr = sb.toString();  
             
            // 要用来做导入用的sql目标文件：  
            FileOutputStream fout = new FileOutputStream(  
                    path+"MS系统数据文件.sql");  
            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf8");  
            writer.write(outStr);  
            // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免  
            writer.flush();  
  
            // 别忘记关闭输入输出流  
            in.close();  
            xx.close();  
            br.close();  
            writer.close();  
            fout.close();  
  
            System.out.println("/* Output OK! */");  
  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		return mapping.findForward("backup");
	}

	public ActionForward coreComp(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		ICompanyInfoDao dao = new CompanyInfoDaoImpl();
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}
		
		//目标页ID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);		
		pc.setPageController(pc.getTotalRowsAmount(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
		pc.setData(dao.findCore((destPage-1)*pc.getPageSize(), pc.getPageSize()));
		
		//构造分页选择器
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString() );
		Collection<CompanyInfo> ten = pc.getData();
		for(CompanyInfo i : ten)
		{
			System.out.println(i.getName());
		}
		return mapping.findForward("coreCompList");
	}
	
	public ActionForward smeComp(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		ICompanyInfoDao dao = new CompanyInfoDaoImpl();
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal2(),1,6);
			req.getSession().setAttribute("pageController1", pc);
		}
		//目标页ID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);		
		pc.setPageController(pc.getTotalRowsAmount(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
		if(req.getSession().getAttribute("type")==null)
		{
			if(req.getParameter("type")==null)
			{
				pc.setData(dao.findSME((destPage-1)*pc.getPageSize(), pc.getPageSize()));
			}
			else if(req.getParameter("type").equals("0"))
			{
				pc.setData(dao.findSME((destPage-1)*pc.getPageSize(), pc.getPageSize()));
				req.getSession().setAttribute("type", 0);
			}
			else if(req.getParameter("type").equals("1"))
			{
				req.getSession().setAttribute("type", 1);
				pc.setData(dao.findSME1((destPage-1)*pc.getPageSize(), pc.getPageSize()));
			}
			else if(req.getParameter("type").equals("2"))
			{
				req.getSession().setAttribute("type", 2);
				pc.setData(dao.findSME2((destPage-1)*pc.getPageSize(), pc.getPageSize()));
			}
			else if(req.getParameter("type").equals("3"))
			{
				req.getSession().setAttribute("type", 3);
				pc.setData(dao.findSME3((destPage-1)*pc.getPageSize(), pc.getPageSize()));
			}
		}else		
		{
			if(req.getSession().getAttribute("type").toString().equals("0"))
			{
				req.getSession().setAttribute("type", 0);
				pc.setData(dao.findSME((destPage-1)*pc.getPageSize(), pc.getPageSize()));
				
			}
			else if(req.getSession().getAttribute("type").toString().equals("1"))
			{
				req.getSession().setAttribute("type", 1);
				pc.setData(dao.findSME1((destPage-1)*pc.getPageSize(), pc.getPageSize()));
			}
			else if(req.getSession().getAttribute("type").toString().equals("2"))
			{
				req.getSession().setAttribute("type", 2);
				pc.setData(dao.findSME2((destPage-1)*pc.getPageSize(), pc.getPageSize()));
			}
			else if(req.getSession().getAttribute("type").toString().equals("3"))
			{
				req.getSession().setAttribute("type", 3);
				pc.setData(dao.findSME3((destPage-1)*pc.getPageSize(), pc.getPageSize()));
			}
		}
		
		
		//构造分页选择器
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString() );
		Collection<SMEassessment> ten = pc.getData();
		for(SMEassessment i : ten)
		{
			System.out.println(i.getId());
		}
		return mapping.findForward("smeCompList");
	}
	
	
	public ActionForward peoplelist(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		IBankUserDao dao = new BankUserDaoImpl();
		Collection<BankUser> bk = null;
		
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}
		
		//目标页ID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);		
		pc.setPageController(pc.getTotalRowsAmount(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
		pc.setData(dao.find((destPage-1)*pc.getPageSize(), pc.getPageSize()));
		
		//构造分页选择器
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString() );
		Collection<SMEassessment> ten = pc.getData();
		
		return mapping.findForward("peoplelist");
	}

	public ActionForward deleteUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		IBankUserDao dao = new BankUserDaoImpl();
		dao.delete(dao.findById(Integer.parseInt(req.getParameter("bankuserId"))));
		
		return mapping.findForward("deleteUser");
	}
	
	public ActionForward smcompanyDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		IFeedbackDao dao = new FeedbackDaoImpl();
		BankUser user = (BankUser)req.getSession().getAttribute("user");
		int id;
		if (req.getParameter("smcompanyId")==null)
		{
			id = Integer.parseInt(req.getSession().getAttribute("companyinfoId").toString());
		}else
		{
			id = Integer.parseInt((String)req.getParameter("smcompanyId"));
		}
		
		Collection<Feedback> fd = dao.findById(id);
		
		IWarnInfoDao dao2 = new WarnInfoDaoImpl();
		Collection<WarnInfo> wi = dao2.getWarnInfo();
		req.getSession().setAttribute("warninfos", wi);
		
		ICompanyInfoDao dao3 = new CompanyInfoDaoImpl();
		CompanyInfo ci = dao3.findById(id);
		System.out.println(ci.getName());
		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("feedbacks",fd);
		req.getSession().setAttribute("companyinfo",ci);
        req.getSession().setAttribute("companyinfoId",ci.getId());
		
		return mapping.findForward("smcompanyDetail");
	}
	
	public ActionForward corecompanyDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		IFeedbackDao dao = new FeedbackDaoImpl();
		BankUser user = (BankUser)req.getSession().getAttribute("user");
		int id;
		if (req.getParameter("corecompanyId")==null)
		{
			id = Integer.parseInt(req.getSession().getAttribute("companyinfoId").toString());
		}else
		{
			id = Integer.parseInt((String)req.getParameter("corecompanyId"));
		}
		
		Collection<Feedback> fd = dao.findById(id);
		
		IWarnInfoDao dao2 = new WarnInfoDaoImpl();
		Collection<WarnInfo> wi = dao2.getWarnInfo();
		req.getSession().setAttribute("warninfos", wi);
		
		ICompanyInfoDao dao3 = new CompanyInfoDaoImpl();
		CompanyInfo ci = dao3.findById(id);
		
		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("feedbacks",fd);
		req.getSession().setAttribute("companyinfo",ci);
        req.getSession().setAttribute("companyinfoId",ci.getId());
		
		return mapping.findForward("corecompanyDetail");
	}
	
	public ActionForward coreCompList(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		ICompanyInfoDao dao = new CompanyInfoDaoImpl();
		CompanyInfo info = new CompanyInfo();
		int id;
		if (req.getParameter("corecompanyId")==null)
		{
			id = Integer.parseInt(req.getSession().getAttribute("companyinfoId").toString());
		}else
		{
			id = Integer.parseInt((String)req.getParameter("corecompanyId"));
		}
		info = dao.findById(id);
		req.getSession().setAttribute("companyinfo", info);
		return mapping.findForward("coreCompList");
	}
	
	public ActionForward feedback2(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		Feedback fd = new Feedback();
		Date date = new Date();
		String ds = req.getParameter("description");
		BankUser user = (BankUser) req.getSession().getAttribute("user");
		ICompanyInfoDao dao = new CompanyInfoDaoImpl();
		CompanyInfo ci = (CompanyInfo) req.getSession().getAttribute("companginfo");
		
		req.getSession().setAttribute("companyinfoId", ci.getId());
		
		fd.setTime(date);
		fd.setDescription(ds);
		fd.setReviewer(1);
		fd.setCompanyInfo(ci);
		
		IFeedbackDao dao2 = new FeedbackDaoImpl();
		dao2.add(fd);
		
		return mapping.findForward("feedback2");
	}
	
	public ActionForward companysearch2(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		CompanyInfo ci = (CompanyInfo) req.getSession().getAttribute("companyinfo");
		SimpleDateFormat simFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		Date d1 = simFormat.parse(req.getParameter("lo"));
		Date d2 = simFormat.parse(req.getParameter("mo"));
		ICompanyInfoDao dao = new CompanyInfoDaoImpl();
		Collection<SMEassessment> sm = dao.findByTime(d1, d2, ci.getId());
		req.getSession().setAttribute("companyinfoId", ci.getId());
		req.getSession().setAttribute("sm", sm);
		
		return mapping.findForward("companysearch2");
	}
	
	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getSession().invalidate();
		
		return mapping.findForward("logout");
	}
	
	public ActionForward getback(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		BankUser user = (BankUser) req.getSession().getAttribute("user");
		if(user.getUsertype().getId()==1)
		{
			req.getSession().setAttribute("user", user);
			return mapping.findForward("getback1");
		}else
		{
			req.getSession().setAttribute("user", user);
			return mapping.findForward("getback2");
		}
		
	}
	
}
