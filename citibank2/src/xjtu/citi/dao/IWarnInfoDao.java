package xjtu.citi.dao;

import java.util.Collection;

import xjtu.citi.entity.WarnInfo;

public interface IWarnInfoDao {

	//计算出预警值
	public double calWarnValue();
	//判断是否超出临界预警值
	public Boolean isOverLimited();
	//添加预警信息
	public Collection<WarnInfo> getWarnInfo();
}
