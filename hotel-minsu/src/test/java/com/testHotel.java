package com;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.app.manager.ea.api.InfEa;
import com.app.manager.ea.model.Resource;
import com.app.manager.ea.model.User;
import com.app.manager.hotel.model.Fee;
import com.app.model.Tb1;

import com.common.spring.ok.AbstractBaseTestCase;
import com.common.spring.ssh.dao.BaseDao;
import com.common.spring.ssh.page.Pagination;
import com.common.time.TimeUtil;

/*
 每个方法之前会重新将数据库重新建一次，这样比较好，每个方法之间没有数据关联性
 */
public class testHotel extends AbstractBaseTestCase {
	static Logger log = LoggerFactory.getLogger(testHotel.class);
	private BaseDao baseDao;
	private InfEa infEa;
  
	@Before
	public void prepare() throws Exception {
		baseDao = (BaseDao) applicationContext.getBean("eaDaoTarget");
		infEa = (InfEa) applicationContext.getBean("impEa");
		infEa.initData();
	}
	
	@Test
	public void createfee() throws Exception {
		Fee  fee=new Fee();
		fee.setFeedate(TimeUtil.getTimeStr("yyyy-MM-dd hh:mm:ss"));
		fee.setFee("22");
	
		fee.setRemark(java.net.URLDecoder.decode("33"));
		fee.setOrganizeId("2");
		baseDao.create(fee);
	}
	
	
	
}
