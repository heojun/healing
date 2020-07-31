package po.vendor;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import po.common.FileVO;
import po.common.SearchVO;

@Service
public class VendorService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private DataSourceTransactionManager txManager;

	public Integer selectVendorCount(SearchVO param) throws Exception {
		return sqlSession.selectOne("selectVendorCount", param);
	}
	public List<?> selectVendorList(SearchVO param) throws Exception { 
		return sqlSession.selectList("selectVendorList", param);
	}

	public void insertVendor(VendorVO param, List<FileVO> filelist, String[] fileno) throws Exception {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try{
			if (param.getId()==null || "".equals(param.getId())) {
				param.setId(UUID.randomUUID().toString());
				sqlSession.insert("insertVendor", param);
			} 
			else {
				sqlSession.update("updateVendor", param);
			}
			if (fileno != null) {
				HashMap p = new HashMap();
				p.put("fileno", fileno) ;
				sqlSession.insert("deleteVendorFile", p);
			}

			for (FileVO f : filelist) {
				f.setVendor(param.getId());
				sqlSession.insert("insertVendorFile", f);
			}
			txManager.commit(status);
		} catch (Exception ex) {
			txManager.rollback(status);
			throw ex;
		}	    	
	}

	public VendorVO selectVendorOne(String param) throws Exception {
		return sqlSession.selectOne("selectVendorOne", param);
	}

	public void deleteVendorOne(String param) throws Exception {
		sqlSession.delete("deleteVendorOne", param);
	}
	
	public List<?> selectVendorFileList(String param) throws Exception {
		return sqlSession.selectList("selectVendorFileList", param);
    }

}
