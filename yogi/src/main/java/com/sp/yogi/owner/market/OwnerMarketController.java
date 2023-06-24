package com.sp.yogi.owner.market;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.yogi.member.SessionInfo;

@Controller("owner.market.ownerMarketController")
@RequestMapping("/owner/market/*")
public class OwnerMarketController {
	
	@Autowired
	private MarketService service;

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
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "owner"+ File.separator +"market";
		Market img=service.readResImg(dto.getRestaurantNum(),path);
		
		model.addAttribute("dto",dto);//가게정보
		model.addAttribute("userId",info.getUserId());//로그인한 회원의 아이디
		model.addAttribute("tipList",tipList);//로그인한 회원가게의 팁리스트
		model.addAttribute("img",img);//로그인한 회원가게의 이미지 정보
		
		return ".owner.market.marketinfo";
	}
	
	//로고이미지 넣기 
	@RequestMapping(value = "insertimg", method = RequestMethod.POST)
	public String insertimg(Market dto, HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"owner"+File.separator+"market";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			//saveFilename이랑 restaurantNum 불러와서 넘겨줘야함
			System.out.println("이미지 파일 : " + dto.getImageFilename() + " : " + dto.getRestaurantNum());
			service.insertResImg(dto, path);
		} catch (Exception e) {
			e.printStackTrace();//오류확인하고지우기
		}
		return "rediect:/owner/market/marketinfo";
	}

	@RequestMapping(value = "updateInfo", method = RequestMethod.POST)
	public String updateInfo(Market dto, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			Market res= service.readRestaurant2(info.getUserId());
			dto.setRestaurantNum(res.getRestaurantNum());
			service.updateFoodInfo(dto);
			
		} catch (Exception e) {
			e.printStackTrace();//오류확인하고지우기
		}
		
		
		return "rediect:/owner/market/marketinfo";
	}
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String review() {
		
		return ".owner.market.review";
	}
}
