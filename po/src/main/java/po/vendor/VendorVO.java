package po.vendor;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import po.common.utiletc;

public class VendorVO {

    private String id;
	private String name;
    private String address;
    private String tel;
    private String bName;
    private String accountNo;
    private String bAddress;
    private String bank;
    private String swiftCode;
    private String usingYn = "Y";
    private String currencyCode;
	private String createDateTime;
    private String updateDateTime;
    private String filecnt;
    /* 첨부파일 */
	private List<MultipartFile> uploadfile;
	
	
    public String getFilecnt() {
		return filecnt;
	}
	public void setFilecnt(String filecnt) {
		this.filecnt = filecnt;
	}
    
    public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getShortTitle(Integer len){
    	return utiletc.getShortString(name, len);
    }
    public String getCurrencyCode() {
		return currencyCode;
	}


	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

    
    public String getUsingYn() {
		return usingYn;
	}

	public void setUsingYn(String usingYn) {
		this.usingYn = usingYn;
	}
    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getbAddress() {
		return bAddress;
	}

	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getSwiftCode() {
		return swiftCode;
	}

	public void setSwiftCode(String swiftCode) {
		this.swiftCode = swiftCode;
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
