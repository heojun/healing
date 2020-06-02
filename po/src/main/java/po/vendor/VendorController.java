package po.vendor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import po.common.SearchVO;

@Controller
public class VendorController {

	@Autowired
	private VendorService vendorService;

	// 리스트
	@RequestMapping(value = "/vendorList")
	public String vendorList(SearchVO searchVO, ModelMap modelMap) throws Exception {

		searchVO.pageCalculate( vendorService.selectVendorCount(searchVO) ); 

		List<?> listview   = vendorService.selectVendorList(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		return "vendor/vendorList";
	}

	// 글 쓰기 
	@RequestMapping(value = "/vendorForm")
	public String vendorForm(HttpServletRequest request, ModelMap modelMap) throws Exception {
		String id = request.getParameter("id");
		if (id!=null) {
			VendorVO vendorInfo = vendorService.selectVendorOne(id);

			modelMap.addAttribute("vendorInfo", vendorInfo);
		}

		return "vendor/vendorForm";
	}

	@RequestMapping(value = "/vendorSave")
	public String vendorSave(VendorVO vendorInfo) throws Exception {

		vendorService.insertVendor(vendorInfo);

		return "redirect:/vendorList";
	}

	// 글 읽기
	@RequestMapping(value = "/vendorRead")
	public String vendorSave(HttpServletRequest request, ModelMap modelMap) throws Exception {

		String id = request.getParameter("id");

		VendorVO vendorInfo = vendorService.selectVendorOne(id);

		modelMap.addAttribute("vendorInfo", vendorInfo);

		return "vendor/vendorRead";
	}

	// 글 삭제
	@RequestMapping(value = "/vendorDelete")
	public String vendorDelete(HttpServletRequest request) throws Exception {

		String id = request.getParameter("id");

		vendorService.deleteVendorOne(id);

		return "redirect:/vendorList";
	}

	@RequestMapping(value = "/deleteVendors", method = RequestMethod.POST) 
	public String deleteVendors(@RequestParam("delete_vendor_ids") String[] delete_vendor_ids, ModelMap modelMap) throws Exception { 
		for (String vendor_id : delete_vendor_ids) { 
			vendorService.deleteVendorOne(vendor_id); 
		}
		// 목록 페이지로 이동 
		return "redirect:/vendorList"; 
	}
}

