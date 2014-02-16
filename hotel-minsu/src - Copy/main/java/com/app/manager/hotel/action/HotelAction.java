package com.app.manager.hotel.action;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.app.common.base.action.BaseEaAction;
import com.app.common.spring.ssh.model.BaseModel;
import com.app.ea.model.Organize;
import com.app.ea.model.Role;
import com.app.ea.model.User;
import com.app.manager.hotel.model.Fee;

import com.opensymphony.util.BeanUtils;
import com.utils.time.TimeUtil;

@Component("hotelAction")
@Scope("prototype")
public class HotelAction extends BaseEaAction {

	private static Logger log = LoggerFactory.getLogger(HotelAction.class);
	public User user = new User();

	public String list_hotel() throws Exception {
		Organize organize = (Organize) infEa.getOrganizeByAlias("hotel");
		rhs.put("organizeRootList", organize.getChildOrganizes());
		rhs.put("system_para_map", infEa.getParaMap());
		common_get_extp("Organize");
		return "success";
	}
	public String list_room() throws Exception {
		 list_hotel();
		 return "success";
	}
	
	
	public String contract() throws Exception {
		rhs.put("rolegroupRootList", common_get_tree_root("Rolegroup"));
		common_load_organize_hotel();
		rhs.put("userList", infEa.getAllUser());
		return "success";
	}
	
	public String fee() throws Exception {
		common_load_organize_hotel();
	
		return "success";
	}
	
	
	public String save_new_user() throws Exception {
		log.debug(user.getName());
		User user=new User();
		user.setName(getpara("name"));
		user.setAccount(getpara("account"));
		Role role=(Role)baseDao.loadById("Role",
				Long.parseLong(getpara("roleId")));
		role.getUsers().add(user);
		baseDao.create(user);
		rhs.put("info", user.getName()+ " 添加成功!");
		//load_organize();
		return "success";
	}

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public void common_load_organize_hotel() throws Exception {
		rhs.put("system_para_map", infEa.getParaMap());
		common_get_extp("Organize");
		Organize organize = (Organize) baseDao.loadById("Organize",
				Long.parseLong(getpara("organizeId")));
		rhs.put("organize", organize);
		common_fee();
		
	}
	
    public List getFeeList(){
       	return baseDao.find("from Fee f where f.organizeId='"+getpara("organizeId")+"'");
       
    }
	public void common_fee(){
	    	rhs.put("feelist", getFeeList());
			rhs.put("organizeId", getpara("organizeId"));
	    }	
		
		public String fee_load() throws Exception {
			rhs.put("fee", infEa.getbaseDao().loadById("Fee", Long.parseLong(getpara("feeid"))));
			rhs.put("organize", infEa.getbaseDao().loadById("Organize", Long.parseLong(getpara("organizeId"))));
			rhs.put("user", getUser());
			return "success";
			
		}	

		public String fee_delete() throws Exception {
			BaseModel model = (BaseModel) infEa.getbaseDao().loadById("Fee",Long.parseLong(getpara("feeid")));	
			baseDao.delete(model);
			common_fee();
			return "success";
		}	
		
		public String fee_update() throws Exception {
			String id = getpara("id");
			String column =  getpara("column");
			//String columnValue = getpara("columnValue");
			String columnValue = java.net.URLDecoder.decode(getpara("columnValue"));
			
			BaseModel modle = (BaseModel) baseDao.loadById(getpara("beanname"),
					Long.parseLong(id));
			BeanUtils.setValue(modle, column, columnValue);
			baseDao.update(modle);
			
			common_fee();
			return "success";
		}	
		public Fee getFee() throws Exception {
			Fee  fee=new Fee();
			fee.setFeedate(TimeUtil.getTimeStr("yyyy-MM-dd"));
			fee.setFee(getnumberpara("fee"));
			fee.setEfee(getnumberpara("efee"));
			fee.setHfee(getnumberpara("hfee"));
			fee.setWfee(getnumberpara("wfee"));
			fee.setNfee(getnumberpara("nfee"));
			fee.setDepositfee(getnumberpara("depositfee"));
			fee.setEnumber(getnumberpara("enumber"));
			fee.setWnumber(getnumberpara("wnumber"));
			
			fee.setLenumber(getnumberpara("lenumber"));
			fee.setLwnumber(getnumberpara("lwnumber"));
			
			fee.setContractpaydate(getpara("contractpaydate"));			
			fee.setEvalue(getnumberpara("evalue"));
			fee.setWvalue(getnumberpara("wvalue"));
			
			fee.setRemark(java.net.URLDecoder.decode( java.net.URLDecoder.decode(getpara("usernameList")) +":"+getpara("remark"))    );
			return fee;
		}	
		
		public String print_free() throws Exception {
			 Fee  fee=getFee();
			 rhs.put("fee", fee);
			 rhs.put("organize", infEa.getbaseDao().loadById("Organize", Long.parseLong(getpara("organizeId"))));
			return "success";
		}
		
		public String print_notify() throws Exception {
			print_free();
			return "success";
		}			
		public String fee_create() throws Exception {
			Fee  fee=getFee();
			fee.setOrganizeId(getpara("organizeId"));
			baseDao.create(fee);
			//更新上期读数
			common_update_extp("Organize",getpara("organizeId"),"enumber",getnumberpara("enumber"));
			common_update_extp("Organize",getpara("organizeId"),"wnumber",getnumberpara("wnumber"));
			common_fee();
		    rhs.put("info", "消费金额登记成功");
			return "success";
		}		
	
//select * from hotel_fee  where feedate >= '2012-10-01' and  feedate <='2013-10-01'
}
