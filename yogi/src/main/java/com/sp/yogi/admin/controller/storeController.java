package com.sp.yogi.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.admin.domain.Store;
import com.sp.yogi.admin.service.StoreService;

@Controller("admin.storeController")
@RequestMapping("/admin/store/*")
public class storeController {
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value = "storeList", method=RequestMethod.GET)
	public String storeList(
			Model model
			) throws Exception {
		
		int count = storeService.countWait();
		
		List<Store> list = storeService.listWait();
		
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return ".admin.store.storeList";
	}

	@RequestMapping(value = "storeDetail", method=RequestMethod.GET)
	public String storeDetail(
			@RequestParam("restaurantNum") Long restaurantNum,
			Model model
			) throws Exception {
		
		Store dto = storeService.waitInfo(restaurantNum);
		
		model.addAttribute("dto", dto);
		
		return ".admin.store.storeDetail";
	}
	
	@GetMapping("permit")
	public String permitWait(
			@RequestParam("restaurantNum") Long restaurantNum
			) throws Exception {

		try {
			storeService.permitWait(restaurantNum);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/store/storeList";
	}
	
	@PostMapping("reject")
	public String permitWait(
			@RequestParam("restaurantNum") Long restaurantNum,
			@RequestParam("content") String content
			) throws Exception {

		try {
			storeService.rejectWait(restaurantNum);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/store/storeList";
	}
}
