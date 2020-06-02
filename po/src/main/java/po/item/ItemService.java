package po.item;

import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import po.common.SearchVO;

@Service
public class ItemService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
		
    public Integer selectItemCount(SearchVO param) throws Exception {
		return sqlSession.selectOne("selectItemCount", param);
    }
    public List<?> selectItemList(SearchVO param) throws Exception { 
		return sqlSession.selectList("selectItemList", param);
    }
    public List<?> selectVendorSelectList() throws Exception { 
		return sqlSession.selectList("selectVendorSelectList");
    }
    
    public void insertItem(ItemVO param) throws Exception {
    	if (param.getId()==null || "".equals(param.getId())) {
    		param.setId(UUID.randomUUID().toString());
    		sqlSession.insert("insertItem", param);
    	} 
    	else sqlSession.update("updateItem", param);
    }
 
    public ItemVO selectItemOne(String param) throws Exception {
		return sqlSession.selectOne("selectItemOne", param);
    }
    
    public void deleteItemOne(String param) throws Exception {
		sqlSession.delete("deleteItemOne", param);
    }
    
}
