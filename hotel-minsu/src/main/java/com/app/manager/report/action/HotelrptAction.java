package com.app.manager.report.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.app.manager.ea.action.BaseEaAction;

@Component("hotelrptAction")
@Scope("prototype")
public class HotelrptAction extends BaseEaAction {
	
	private static Logger log = LoggerFactory.getLogger(HotelrptAction.class);
	
	public String fee() {

    	rhs.put("feelist", baseDao.find("from Fee f "));
		
		return "success";
	}
	
	
	public String fee_bytime() {

    	rhs.put("feelist", baseDao.find("from Fee f where feedate >= '"+getpara("begindate")+"' and  feedate <='"+getpara("enddate")+"'"));
    	rhs.put("begindate", getpara("begindate"));
       	rhs.put("enddate", getpara("enddate"));
		return "success";
	}

	
	
}
