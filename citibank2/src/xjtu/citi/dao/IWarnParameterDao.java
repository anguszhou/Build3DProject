package xjtu.citi.dao;

import xjtu.citi.entity.WarnParameter;

public interface IWarnParameterDao {
	//增加参数值
	public void add(WarnParameter warnpara);
	//修改参数值
	public void modify(WarnParameter warnpara);
	//找出最近修改的参数值
	public WarnParameter find();
}
