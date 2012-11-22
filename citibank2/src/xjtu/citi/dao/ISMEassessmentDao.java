package xjtu.citi.dao;

import java.util.Collection;

import xjtu.citi.entity.SMEassessment;


public interface ISMEassessmentDao {
	//计算找出大企业(函数要用的参数可以自己定义)
	public Collection findCoreComp();
	//计算出相应中小企业的分值(函数要用的参数可以自己定义)
	public Collection calSMEassess();
	//根据企业id查询出所有该企业的sme信息
	public Collection <SMEassessment>findByCompanyId(int id);
	public Collection<SMEassessment> getSMEassess();

}
