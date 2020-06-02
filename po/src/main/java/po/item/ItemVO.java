package po.item;

import po.common.utiletc;

public class ItemVO {

    private String id;
	private String vendor;
	private String vendorName;
	private String name;
	private float unitPrice;
    private String usingYn = "Y";
    private String createDateTime;
    private String updateDateTime;
    
    public String getShortTitle(Integer len){
    	return utiletc.getShortString(name, len);
    }
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getUsingYn() {
		return usingYn;
	}
	public void setUsingYn(String usingYn) {
		this.usingYn = usingYn;
	}
	public String getCreateDateTime() {
		return createDateTime;
	}
	public void setCreateDateTime(String createDateTime) {
		this.createDateTime = createDateTime;
	}
	public String getUpdateDateTime() {
		return updateDateTime;
	}
	public void setUpdateDateTime(String updateDateTime) {
		this.updateDateTime = updateDateTime;
	}

    
    
   

}
