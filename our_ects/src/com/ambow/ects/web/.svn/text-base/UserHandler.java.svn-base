package com.ambow.ects.web;

import java.util.Iterator;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.IUserDao;
import com.ambow.ects.dao.impl.UserDaoHibernateImp;
import com.ambow.ects.entity.ContcatInfo;
import com.ambow.ects.entity.Province;
import com.ambow.ects.entity.User;
import com.ambow.ects.util.HibernateUtils;

public class UserHandler extends MappingDispatchAction {
		
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao  = new UserDaoHibernateImp();
		User user = null;
		
		try {			
			user = dao.login(req.getParameter("name"), req.getParameter("password"));						
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
		}
		if(user != null)
		{
			req.getSession().setAttribute("user", user);
			return mapping.findForward("index");
		}
		else
		{
			req.setAttribute("message", "用户名或密码有误，请重新登录！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}		
	}
	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		req.getSession().invalidate();
		
		return mapping.findForward("index");
	}

	public ActionForward regist(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao = new UserDaoHibernateImp();
		User user = new User();
		
		user.setName(req.getParameter("name"));
		user.setPasswd(req.getParameter("password"));
		//user.setId(Integer.parseInt(req.getParameter("user_id")));
		
		ContcatInfo info = new ContcatInfo();
		//info.setId(Integer.parseInt(req.getParameter("info_id")));
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setHomePhone(req.getParameter("homePhone"));
		info.setOfficePhone(req.getParameter("officePhone"));
		info.setStreet1(req.getParameter("street1"));
		info.setStreet2(req.getParameter("street2"));
		info.setCity(req.getParameter("city"));
		info.setZip(req.getParameter("zip"));		
		
		Province pro = getProvince(Integer.parseInt(req.getParameter("province")));
		info.setProvince(pro);
		info.setCountry(pro.getCountry());
		
		user.setInfo(info);
		info.setUser(user);	
		
		try {
			
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


	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao = new UserDaoHibernateImp();
		User user = (User)req.getSession().getAttribute("user");
		
		user.setName(req.getParameter("name"));
		user.setPasswd(req.getParameter("password"));
		user.setId(user.getId());
		
		ContcatInfo info = new ContcatInfo();
		info.setId(user.getInfo().getId());
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setHomePhone(req.getParameter("homePhone"));
		info.setOfficePhone(req.getParameter("officePhone"));
		info.setStreet1(req.getParameter("street1"));
		info.setStreet2(req.getParameter("street2"));
		info.setCity(req.getParameter("city"));
		info.setZip(req.getParameter("zip"));
		
		Province pro = getProvince(Integer.parseInt(req.getParameter("province")));
		info.setProvince(pro);
		info.setCountry(pro.getCountry());
		
		user.setInfo(info);
		info.setUser(user);	
		
		try {
			
			dao.update(user);
			
		} catch (ManagerUserException e) {
			e.printStackTrace();
			req.setAttribute("message", "抱歉，信息修改失败！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", user);
		
		req.getSession(true).setAttribute("user",user);	
		req.setAttribute("message", "恭喜，信息修改成功！");
		req.setAttribute("success", true);
				
		return mapping.findForward("success");
	}
	
	public ActionForward goToAccount(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		int curProId = ((User)req.getSession().getAttribute("user")).getInfo().getProvince().getId();
		
		StringBuffer provinceList = new StringBuffer();
		
		for (Iterator iterator = getProvinceList().iterator(); iterator.hasNext();) {
			
			Province pro = (Province)iterator.next();
			provinceList.append("<option value='")
						.append(pro.getId()).append("' ");
			if(pro.getId() == curProId)
				provinceList.append("selected='selected'");
			provinceList.append(">")
						.append(pro.getName())
						.append("</option>");
			
		}
		
		req.setAttribute("provinceList", provinceList);
		
		return mapping.findForward("account");
	}	
	private Province getProvince(int provinceId){
		
		Session   session = null;
		Transaction  tran = null;
		Province  p = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			p = (Province) session.get( Province.class, provinceId);			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
			return  p;
		}
	}
	private List getProvinceList(){
		
		Session   session = null;
		Transaction  tran = null;
		List ProvinceList = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			ProvinceList =session.createQuery("From Province").list();			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
			return  ProvinceList;
		}
	}

}
