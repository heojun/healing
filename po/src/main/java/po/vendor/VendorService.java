package po.vendor;

import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import po.common.SearchVO;

@Service
public class VendorService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
		
    public Integer selectVendorCount(SearchVO param) throws Exception {
		return sqlSession.selectOne("selectVendorCount", param);
    }
    public List<?> selectVendorList(SearchVO param) throws Exception { 
		return sqlSession.selectList("selectVendorList", param);
    }
    
    public void insertVendor(VendorVO param) throws Exception {
    	if (param.getId()==null || "".equals(param.getId())) {
    		param.setId(UUID.randomUUID().toString());
    		sqlSession.insert("insertVendor", param);
    	} 
    	else sqlSession.update("updateVendor", param);
    }
 
    public VendorVO selectVendorOne(String param) throws Exception {
		return sqlSession.selectOne("selectVendorOne", param);
    }
    
    public void deleteVendorOne(String param) throws Exception {
		sqlSession.delete("deleteVendorOne", param);
    }
    
}
