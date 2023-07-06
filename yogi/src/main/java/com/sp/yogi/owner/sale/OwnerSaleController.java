package com.sp.yogi.owner.sale;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.member.SessionInfo;
import com.sp.yogi.owner.market.Market;
import com.sp.yogi.owner.market.MarketService;


@Controller("owner.sale.ownerSaleController")
@RequestMapping("/owner/sale/*")
public class OwnerSaleController {
	
	@Autowired
	private OwnerSaleService service;

	@Autowired
	private MarketService marketService;

	@RequestMapping(value = "saleTime")
	public String saleTime(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String date1,
			@RequestParam(defaultValue = "") String date2,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		String userId=info.getUserId();
		
		Market marketInfo=marketService.readRestaurant2(userId);
		if(marketInfo==null) {
			return "redirect:/owner/home";
		}
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		int total_price = 0;
		
		LocalDate now = LocalDate.now();
		
		if(date1.length()<2 || date2.length() <2) {
			date1 = now.toString();
			date2 = now.toString();
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("restaurantNum", info.getRestaurantNum());

		total_price = service.total_price(map);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<OwnerSale> list = service.listOwnerSale(map);
		
		
		//Map<String, Object> mapMenu = new HashMap<String, Object>();
		
		for (OwnerSale item : list) {
			item.setOwnerSaleMenu(service.listOwnerSaleMenu(item.getOrderNum()));
        }
        
		model.addAttribute("openState", info.getOpenState());
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_price", total_price);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);

		return ".owner.sale.saleTime";
	}
	
	
	
	
	@RequestMapping(value = "saleMenu")
	public String saleMenu(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String date1,
			@RequestParam(defaultValue = "") String date2,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		String userId=info.getUserId();
		
		Market marketInfo=marketService.readRestaurant2(userId);
		if(marketInfo==null) {
			return "redirect:/owner/home";
		}
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		LocalDate now = LocalDate.now();
		
		if(date1.length() <2 || date2.length() <2) {
			date1 = now.toString();
			date2 = now.toString();
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("restaurantNum", info.getRestaurantNum());

		
		dataCount = service.menuDataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<OwnerSale> list = service.menuList(map);
		
		model.addAttribute("openState", info.getOpenState());
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);

		return ".owner.sale.saleMenu";
	}
	
	


}
