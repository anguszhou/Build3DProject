package xjtu.citi.dao;

import xjtu.citi.entity.WarnParameter;

public interface IWarnParameterDao {
	//���Ӳ���ֵ
	public void add(WarnParameter warnpara);
	//�޸Ĳ���ֵ
	public void modify(WarnParameter warnpara);
	//�ҳ�����޸ĵĲ���ֵ
	public WarnParameter find();
}
