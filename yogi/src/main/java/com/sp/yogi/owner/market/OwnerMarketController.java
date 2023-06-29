package com.sp.yogi.owner.market;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yogi.member.SessionInfo;

@Controller("owner.market.ownerMarketController")
@RequestMapping("/owner/market/*")
public class OwnerMarketController {
	
	@Autowired
	private MarketService service;
	
	@Autowired
	private ReviewService rService;

	@RequestMapping(value = "marketinfo", method = RequestMethod.GET)
	public String marketSubmit(HttpSession session, Model model) throws Exception{
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		String userId=info.getUserId();
		
		Market dto=service.readRestaurant2(userId);
		if(dto==null) {
			return "redirect:/owner/home";
		}
		
		List<Market> tipList=service.listTip(userId);
		
		//String root = session.getServletContext().getRealPath("/");
		//String path = root + "uploads" + File.separator + "owner"+ File.separator +"market";
		
		String imageFilename = service.readResImg(info.getRestaurantNum());
		
		
		model.addAttribute("openState", info.getOpenState());
		model.addAttribute("dto",dto);//가게정보
		model.addAttribute("userId",info.getUserId());//로그인한 회원의 아이디
		model.addAttribute("tipList",tipList);//로그인한 회원가게의 팁리스트
		model.addAttribute("imageFilename",imageFilename);//로그인한 회원가게의 이미지 정보
		
		return ".owner.market.marketinfo";
	}
	
	//로고이미지 넣기 
	@RequestMapping(value = "insertImg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertimg(
			@RequestParam("restaurantNum") long restaurantNum, 
			Market dto, 
			HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"owner"+File.separator+"market";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model=new HashMap<>();
		
		try {
			
			dto.setUserId(info.getUserId());
			//saveFilename이랑 restaurantNum 불러와서 넘겨줘야함
			dto.setRestaurantNum(restaurantNum);
			
			service.insertResImg(dto, path);
			
			model.put("imageFilename", dto.getImageFilename());
		} catch (Exception e) {
			e.printStackTrace();//오류확인하고지우기
		}
		
		return model;
	}
	
	//배달팁 등록
	@RequestMapping(value = "insertTip", method = RequestMethod.POST)
	public String insertTip(@RequestParam("addr")String ad, @RequestParam("deliveryFee")String df, @RequestParam("restaurantNum")long restaurantNum, Market dto, Model model) throws Exception{
		
		try {
			dto.setAddr(ad);
			dto.setDeliveryFee(df);
			dto.setRestaurantNum(restaurantNum);
			service.insertTip(dto);
			
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/market/marketinfo";
	}

	//배달팁 삭제
	@RequestMapping(value = "deleteTip")
	public String deleteTip(@RequestParam long num) throws Exception{
		
		try {
			service.deleteTip(num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/market/marketinfo";
	}
	
	//영업시간 수정
	@RequestMapping(value = "updateHour", method = RequestMethod.POST)
	public String updatePrice(@RequestParam("openingHour")String op, @RequestParam("closingHour")String cl, @RequestParam("restaurantNum")long restaurantNum, Market dto, Model model) throws Exception{
		
		try {
			dto.setOpeningHour(op);
			dto.setClosingHour(cl);
			dto.setRestaurantNum(restaurantNum);
			service.updateHour(dto);
			
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/market/marketinfo";
	}

	//최소주문금액수정
	@RequestMapping(value = "updatePrice", method = RequestMethod.POST)
	public String updatePrice(@RequestParam("basePrice")String bp, @RequestParam("restaurantNum")long restaurantNum, Market dto, Model model) throws Exception{
		
		try {
			dto.setRestaurantNum(restaurantNum);
			dto.setBasePrice(bp);
			service.updateBasePrice(dto);
			
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/market/marketinfo";
	}
	
	//원산지정보수정
	@RequestMapping(value = "updateInfo", method = RequestMethod.POST)
	public String updateInfo(@RequestParam("foodInfo")String ff, @RequestParam("restaurantNum")long restaurantNum, Market dto, Model model) throws Exception{
		
		try {
			dto.setRestaurantNum(restaurantNum);
			dto.setFoodInfo(ff);
			service.updateFoodInfo(dto);
			
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();//오류확인하고지우기
		}
		
		return "redirect:/owner/market/marketinfo";
	}

	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String review(HttpSession session, Model model) throws Exception{
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		String userId=info.getUserId();
		
		Market dto=service.readRestaurant2(userId);
		if(dto==null) {
			return "redirect:/owner/home";
		}
		long restaurantNum=dto.getRestaurantNum();
		
		List<Review> reviewList=rService.reviewList(restaurantNum);
		int reviewCount=rService.reviewCount(restaurantNum);
		double avgRating=rService.avgRating(restaurantNum);
		
		
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("avgRating",avgRating);
		
		return ".owner.market.review";
	}
	 
	// 답글 등록 및 수정
	@PostMapping("insertReply")
	public String insertReply(
			@RequestParam(value = "reply1", required = false) String reply1,
			@RequestParam(value = "reply2", required = false) String reply2,
			@RequestParam("orderNum") Long orderNum,
			Model model
			) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String reply = "";
		
		System.out.println("reply1은 : " + reply1 + " reply2는 : " + reply2);
		System.out.println(orderNum);
		
		if(reply1 == null) {
			reply = reply2;
		} else {
			reply = reply1;
		}
		
		map.put("reply", reply);
		map.put("orderNum", orderNum);
		
		rService.insertReply(map);
	
		return "redirect:/owner/market/review";
	}
	
	// 답글 삭제
	@GetMapping("deleteReply")
	public String deleteReply(
			@RequestParam("orderNum") Long orderNum,
			Model model
			) throws Exception {
		
		rService.deleteReply(orderNum);
	
		return "redirect:/owner/market/review";
	}
}
