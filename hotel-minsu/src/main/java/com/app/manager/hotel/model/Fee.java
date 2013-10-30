package com.app.manager.hotel.model;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.common.spring.ssh.model.BaseModel;


@Entity
@Table(name = "hotel_fee")
public class Fee extends BaseModel {
	private static final long serialVersionUID = 1L;
	private Long id;
	private String organizeId;
	public String operationname;
	public String feedate;	
	
	public String enumber;
	public String wnumber;
	
	public String lenumber;
	public String lwnumber;	
	
	public String begindate;	
	public String enddate;
	public String hfee;
	public String wfee;
	public String efee;
	public String nfee;
	public String contractpaydate;
	
	
	public String evalue;
	public String wvalue;
	
	public String fee;//总额
	public String depositfee; //押金
	public String remark;
	
	
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getFeedate() {
		return feedate;
	}
	public void setFeedate(String feedate) {
		this.feedate = feedate;
	}
	public String getOperationname() {
		return operationname;
	}
	public void setOperationname(String operationname) {
		this.operationname = operationname;
	}
	
	public String getOrganizeId() {
		return organizeId;
	}
	public void setOrganizeId(String organizeId) {
		this.organizeId = organizeId;
	}
	public String getEnumber() {
		return enumber;
	}

	public String getWnumber() {
		return wnumber;
	}
	public void setWnumber(String wnumber) {
		this.wnumber = wnumber;
	}
	public String getBegindate() {
		return begindate;
	}
	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getHfee() {
		return hfee;
	}
	public void setHfee(String hfee) {
		this.hfee = hfee;
	}
	public String getWfee() {
		return wfee;
	}
	public void setWfee(String wfee) {
		this.wfee = wfee;
	}
	public String getEfee() {
		return efee;
	}
	public void setEfee(String efee) {
		this.efee = efee;
	}
	public String getDepositfee() {
		return depositfee;
	}
	public void setDepositfee(String depositfee) {
		this.depositfee = depositfee;
	}
	public void setEnumber(String enumber) {
		this.enumber = enumber;
	}
	public String getNfee() {
		return nfee;
	}
	public void setNfee(String nfee) {
		this.nfee = nfee;
	}
	public String getEvalue() {
		return evalue;
	}
	public void setEvalue(String evalue) {
		this.evalue = evalue;
	}
	public String getWvalue() {
		return wvalue;
	}
	public void setWvalue(String wvalue) {
		this.wvalue = wvalue;
	}
	public String getContractpaydate() {
		return contractpaydate;
	}
	public void setContractpaydate(String contractpaydate) {
		this.contractpaydate = contractpaydate;
	}
	public String getLenumber() {
		return lenumber;
	}
	public void setLenumber(String lenumber) {
		this.lenumber = lenumber;
	}
	public String getLwnumber() {
		return lwnumber;
	}
	public void setLwnumber(String lwnumber) {
		this.lwnumber = lwnumber;
	}
   
}
