package com.app.manager.hotel.javacall;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;

import com.app.common.spring.ssh.dao.BaseDao;
import com.app.manager.hotel.model.Fee;
import com.utils.time.TimeUtil;

@Component("hotelJavacall") 
public class HotelJavacall {
	protected static BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}
	@javax.annotation.Resource(name = "eaDaoTarget")
	public void baseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public static String getLastContractPayDate(String organizeId) throws Exception {
		ArrayList feelist=(ArrayList)baseDao.find("from Fee f where f.organizeId='"+organizeId+"'");
		String lastdate="";
		for (Iterator iterator = feelist.iterator(); iterator.hasNext();) {
			Fee fee = (Fee) iterator.next();
			if(fee.getContractpaydate()!=null&&(!fee.getContractpaydate().equals(""))){
				if(lastdate.equals("")){
					lastdate=fee.contractpaydate;
				}else{
					Date feeContractPayDate=TimeUtil.parseDate(fee.getContractpaydate(), "yyyy-MM-dd");
					if(feeContractPayDate.after(TimeUtil.parseDate(lastdate, "yyyy-MM-dd"))){
						lastdate=fee.contractpaydate;
					}
				}
			}
		}
		
	
		if(lastdate.equals("")){
			return "";
		}else{
			return lastdate;
		}

	}
	
	public static String getHowManyDayToPay(String organizeId) throws Exception {
		String lastdate=getLastContractPayDate( organizeId);
		if(lastdate.equals("")){
			return "-1";
		}else{
			return String.valueOf(TimeUtil.getHowManyDayFromNow(lastdate));
		}

	}
	public static List getFeeList(String organizeId){
       	return baseDao.find("from Fee f where f.organizeId='"+organizeId+"'");
       
    }
}
