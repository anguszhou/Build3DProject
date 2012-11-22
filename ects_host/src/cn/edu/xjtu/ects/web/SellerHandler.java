package cn.edu.xjtu.ects.web;

import java.util.Date;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.apache.struts.upload.FormFile;

import com.sun.xml.internal.bind.v2.model.core.PropertyInfo;

import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.dao.IProductClassDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.IPropertyDao;
import cn.edu.xjtu.ects.dao.ISellerDao;
import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.impl.ProductClassDaoImpl;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.impl.PropertyDaoImpl;
import cn.edu.xjtu.ects.impl.SellerDaoImpl;
import cn.edu.xjtu.ects.impl.UserDaoImpl;
import cn.edu.xjtu.ects.util.PageController;
import cn.edu.xjtu.ects.entity.Category;
import cn.edu.xjtu.ects.entity.ContactInfo;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.ProductClass;
import cn.edu.xjtu.ects.entity.Property;
import cn.edu.xjtu.ects.entity.Seller;
import cn.edu.xjtu.ects.entity.User;


public class SellerHandler extends MappingDispatchAction {
		
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao  = new UserDaoImpl();
		User user = null;
		
		try {			
			user = dao.login(req.getParameter("name"), req.getParameter("password"));						
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
		}
		if(user != null)
		{
			req.getSession().setAttribute("seller", user);
			return mapping.findForward("index");
		}
		else
		{
			req.setAttribute("message", "�û������������������µ�¼��");
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
		/*IUserDao dao = new UserDaoImpl();
		User user = new User();*/
		
		ISellerDao dao = new SellerDaoImpl();
		Seller seller = new Seller(req.getParameter("name"),req.getParameter("password"));
		
		seller.setRealName(req.getParameter("realName"));
		seller.setShopName(req.getParameter("setShopName"));
		seller.setShopDescriptions(req.getParameter("setShopDescriptions"));
		//user.setId(Integer.parseInt(req.getParameter("user_id")));
		
		ContactInfo info = new ContactInfo();
		//info.setId(Integer.parseInt(req.getParameter("info_id")));
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setAddress(req.getParameter("address"));	
		
		seller.setContcatInfo(info);
		info.setUser(seller);	
		
		try {
			
			dao.add(seller);
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
			req.setAttribute("message", "��Ǹ��ע��ʧ�ܣ�");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", seller);
		
		req.getSession(true).setAttribute("user",seller);	
		req.setAttribute("message", "��ϲ��ע��ɹ���");
		req.setAttribute("success", true);
				
		return mapping.findForward("success");
	}


	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		ISellerDao dao = new SellerDaoImpl();
		Seller seller = (Seller)req.getSession().getAttribute("seller");
		
		seller.setName(req.getParameter("name"));
		seller.setPasswd(req.getParameter("password"));
		seller.setId(seller.getId());
		
		
		ContactInfo info = new ContactInfo();
		info.setId(seller.getContcatInfo().getId());
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setAddress(req.getParameter("address"));
		

		
		seller.setContcatInfo(info);
		info.setUser(seller);	
		
		try {
			
			dao.update(seller);
			
		} catch (ManagerUserException e) {
			e.printStackTrace();
			req.setAttribute("message", "��Ǹ����Ϣ�޸�ʧ�ܣ�");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", seller);
		
		req.getSession(true).setAttribute("user",seller);	
		req.setAttribute("message", "��ϲ����Ϣ�޸ĳɹ���");
		req.setAttribute("success", true);
				
		return mapping.findForward("success");
	}
	
	public ActionForward showSellers(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
	
		ISellerDao dao = new SellerDaoImpl();
		//��ȡ��ҳ������
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}
		
		//Ŀ��ҳID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);		
		pc.setPageController(pc.getTotalRowsAmount(), destPage);
		
		//���´�����ֻ��Ҫ�޸�dao���õĺ�������
		pc.setData(dao.find((destPage-1)*pc.getPageSize(), pc.getPageSize()));
		
		//�����ҳѡ����
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString() );
		Collection<Seller> ten = pc.getData();
		for(Seller i : ten)
		{
			System.out.println(i.getName());
		}
		return mapping.findForward("showsellers");
	}
	
	public ActionForward sellerDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		int sellerId = Integer.parseInt(req.getParameter("sellerId"));		
		
		
		req.setAttribute("sellerDetail", new SellerDaoImpl().findById(sellerId));
				
		return mapping.findForward("sellerDetail");
	}	
	
	
	
	public ActionForward goToAccount(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		
		return mapping.findForward("account");
	}	
	
	public ActionForward listBySellerId(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IProductDao dao = new ProductDaoImpl();
		//��ȡ��ҳ������
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}	
		
		//Ŀ��ҳID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);
		
		//���´�����ֻ��Ҫ�޸�dao���õĺ�������
		Seller seller =(Seller)req.getAttribute("Seller");
		Collection<Product> data = dao.findBySellerId(0, 100000000,14);
		
		if(data == null)
			pc.setPageController(0, destPage);
		else
			pc.setPageController(data.size(), destPage);
		
		int fromIndex = (destPage-1)*pc.getPageSize();
		int toIndex = destPage*pc.getPageSize()>=data.size()?data.size():destPage*pc.getPageSize();
		pc.setData(((List)data).subList(fromIndex, toIndex));
		//�����ҳѡ����
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString());
		
		for (Product i :data)
		{
			System.out.println(i.getName());
		}
		
		return mapping.findForward("sellerProductList");
		
	}
	
	public ActionForward showSeller(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		ISellerDao dao = new SellerDaoImpl();
		User user = (User) req.getSession().getAttribute("user");
		
		Seller seller = dao.findById(user.getId());
		String name = seller.getName();
		String passwd = seller.getPasswd();
		req.getSession().setAttribute("seller",seller);
		req.getSession().setAttribute("name",name);
		req.getSession().setAttribute("password",passwd);
		return mapping.findForward("showSeller");
	}
	
	public ActionForward modifySeller(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
				
		
		
		
		/*user.setId(user.getId());*/
		/*System.out.println(user.getId());
		System.out.println(user.getName());
		System.out.println(user.getPasswd());*/
		
		ISellerDao dao2 = new SellerDaoImpl();
		Seller seller = (Seller)req.getSession().getAttribute("seller");
		//seller.setId(user.getId());
		seller.setName(req.getParameter("name"));
		seller.setPasswd(req.getParameter("password"));
		seller.setRealName(req.getParameter("realName"));
		seller.setShopName(req.getParameter("shopName"));
		seller.setQQ(req.getParameter("QQ"));
		seller.setShopDescriptions(req.getParameter("shopDescriptions"));
		System.out.println(seller.getRealName());
		
		try {
			
			//dao.update(user);
			dao2.update(seller);
			
		} catch (ManagerUserException e) {
			e.printStackTrace();
			req.setAttribute("message", "��Ǹ����Ϣ�޸�ʧ�ܣ�");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		
		
		req.getSession(true).setAttribute("seller",seller);	
		req.setAttribute("message", "��ϲ����Ϣ�޸ĳɹ���");
		req.setAttribute("success", true);
				
		return mapping.findForward("success");
	
	}
	public ActionForward addSellerProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		System.out.println(1);
		Category category = new Category();
		String categoryName = (String) req.getParameter("citylist");
		category = category.findByName(categoryName);
		System.out.println(categoryName);
		IProductClassDao pc = new ProductClassDaoImpl();
		ProductClass productClass = new ProductClass();
		String productClassName = (String)req.getParameter("citycode");
		System.out.println(productClassName);
		productClass = pc.findByName(productClassName);
		productClass.setCategory(category);
		//System.out.println(productClass.getCategory().getDescriptions());
		System.out.println(4);
		IProductDao pd = new ProductDaoImpl();
		Product product = new Product();		
		product.setName((String)req.getParameter("productName"));
		product.setPrice(Double.parseDouble((String) req.getParameter("productPrice")));
		String time = (String)req.getParameter("productTime");
		String description = (String)req.getParameter("productDescription");
	  
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		//Date productTime = (Date)format.parse(time);
		Date productTime = java.sql.Date.valueOf(time);
	  
		product.setTime(productTime);
	   // product.setProductClass(productClass);
	    product.setDescriptions(description);
	    product.setProductClass(productClass);
		
	    Seller seller = (Seller)req.getSession().getAttribute("seller");
	    product.setSeller(seller);
	   
	  
	    pd.addProduct(product);
	    req.getSession().setAttribute("product",product);
	   
		return mapping.findForward("addProperty");
	}
	
	public ActionForward addProperty(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		


		int productId = Integer.parseInt(req.getParameter("productId"));
		IProductDao dao2 =new ProductDaoImpl();
		Product product = dao2.findById(productId);
		
		IProductDao pd = new ProductDaoImpl();
		product.setName((String)req.getParameter("productName"));
		product.setPrice(Double.parseDouble((String) req.getParameter("productPrice")));
		String time = (String)req.getParameter("productTime");
		String description = (String)req.getParameter("productDescription");

		//Date productTime = (Date)format.parse(time);
		Date productTime = java.sql.Date.valueOf(time);
	  
		product.setTime(productTime);
	   // product.setProductClass(productClass);
	    product.setDescriptions(description);

	    pd.update(product);
		
		Property pro = new Property();
		pro.setProduct(product);
		pro.setPropertyName(req.getParameter("addPropertyName"));
		pro.setPropertyValue(req.getParameter("addPropertyValue"));
		
		System.out.println(pro.getPropertyName()+pro.getPropertyValue());
		IPropertyDao dao = new PropertyDaoImpl();
		dao.addProperty(pro);
		
		Collection<Property>propertys = product.getPropertys();
		propertys.add(pro);
		req.getSession().setAttribute("product",product);

		return mapping.findForward("addProperty2");
	}
	public ActionForward deleteProperty(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		System.out.println(1);
		//int productId = Integer.parseInt(req.getParameter("productId"));
		IProductDao dao2 =new ProductDaoImpl();
		Product product = (Product) req.getSession().getAttribute("product");
		System.out.println(2);
		
		IPropertyDao dao = new PropertyDaoImpl();
		int id = Integer.parseInt(req.getParameter("propertyId"));
		Property pro = dao.findById(id);
		dao.delete(pro);
		System.out.println(3);
		Collection<Property>propertys = product.getPropertys();
		propertys.remove(pro);
		req.getSession().setAttribute("product",product);

		return mapping.findForward("addProperty2");
	}
	
	public ActionForward upload(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
        System.out.println("shangchuang");
		UploadForm fileForm = (UploadForm) form;
		FormFile file = fileForm.getFile();
		String filePath = request.getRealPath("/songs");
		FileOutputStream fileOutput = new FileOutputStream(filePath + "/" + file.getFileName());
		
		//�������url������ɾ����ʹ��
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
	
	
	public ActionForward deleteProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IProductDao dao = new ProductDaoImpl();
		Product pro = dao.findById(Integer.parseInt(req.getParameter("productId")));
		dao.delete(pro);
		
		return mapping.findForward("deleteProduct");
	}
	void maim() throws ManagerUserException
	{
		IUserDao dao = new UserDaoImpl();
		User user = dao.login("zc", "zc");
		System.out.println(user.getName());
		System.out.println(user.getPasswd());
		System.out.println(user.getId());
	}

}
